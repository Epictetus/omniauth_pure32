require 'spec_helper'

describe "Multiple Login Services" do

  before do
    u = User.find_or_create_by_name(:name => "Joe Public", :email => "joe@example.com",
                                    :password => "secret123", :password_confirmation => "secret123")

    s = Service.find_or_initialize_by_provider_and_uid(:provider => 'aol',
                                           :uid => '44444', :uname => 'Joe Public',
                                           :uemail => "joe@example.com")
    s.user_id = u.id
    s.save
    
    t = Service.find_or_initialize_by_provider_and_uid( :provider => 'yahoo',
                                           :uid => '33333', :uname => 'Joe Public',
                                           :uemail => "joe@example.com")
    t.user_id = u.id
    t.save
  end

  describe "Sign in with AOL" do
    it "works!" do
      visit '/auth/aol'
      page.should have_content "joe@example.com"
    end
  end

	describe "Try to Add and Delete Yahoo Authentication" do
		it "should succeed because we are logged in with AOL account" do
			visit '/auth/aol'
			visit '/services'
			page.should have_content "Aol: 44444"
			page.should have_content "Yahoo: 33333"
			page.should have_content "Remove this service"
			click_link 'Remove this service'
			page.should have_content "Aol: 44444"
			page.should_not have_content "Yahoo: 33333"
		end
	end

  # describe "Try to Add and Delete AOL Authentication" do
  #     it "should fail because we are logged in with AOL account" do
  #       visit '/auth/aol'
  #       visit '/services'
  #       page.should have_content "Aol: 44444"
  #       page.should have_content "Yahoo: 33333"
  #       page.should have_content "Remove this service"
  #       click_link 'Remove this service'
  #       page.should have_content "Aol: 44444"
  #       page.should_not have_content "Yahoo: 33333"
  #     end
  #   end
end