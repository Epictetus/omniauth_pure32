require 'spec_helper'

describe "Yahoo (openid) Services" do

  before do
    u = User.find_or_create_by_name(:name => "Joe Public", :email => "joe@example.com",
                                    :password => "secret123", :password_confirmation => "secret123")

    s = Service.find_or_initialize_by_user_id( :user_id => u.id, :provider => 'yahoo',
                                           :uid => '33333', :uname => 'Joe Public',
                                           :uemail => "joe@example.com")
    s.user_id = u.id
    s.save
  end

  describe "GET /auth/yahoo" do
    it "works!" do
      visit '/auth/yahoo'
      page.should have_content "joe@example.com"
    end
  end

  describe "GET /users/test" do
	  it "should show the secret page" do
		  visit "/auth/yahoo"
		  visit "/users/test"
		  page.should have_content "This page can be viewed by authenticated users only!"
	  end
  end

	describe "GET /services" do
		it "should work" do
			visit '/auth/yahoo'
			visit '/'
			visit '/services'
			page.should have_content "Yahoo: 33333"
		end
	end

	describe "Sign In and Sign Out" do
		it "should work" do
			visit '/auth/yahoo'
			visit '/'
			visit '/signout'
			page.should have_content "You have been signed out!"
		end
	end
end