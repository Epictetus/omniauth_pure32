require 'spec_helper'

describe "Github Services" do

  before do
    u = User.find_or_create_by_name(:name => "Joe Public", :email => "joe@example.com",
                                    :password => "secret123", :password_confirmation => "secret123")

    s = Service.find_or_initialize_by_user_id( :user_id => u.id, :provider => 'github',
                                           :uid => '54321', :uname => 'Joe Public',
                                           :uemail => "joe@example.com")
    s.user_id = u.id
    s.save
  end

  describe "GET /auth/github" do
    it "works!" do
      visit '/auth/github'
      page.should have_content "joe@example.com"
    end
  end

  describe "GET /users/test" do
	  it "should show the secret page" do
		  visit "/auth/github"
		  visit "/users/test"
		  page.should have_content "This page can be viewed by authenticated users only!"
	  end
  end

	describe "GET /services" do
		it "should work" do
			visit '/auth/github'
			visit '/'
			visit '/services'
			page.should have_content "Github: 54321"
		end
	end

	describe "Sign In and Sign Out" do
		it "should work" do
			visit '/auth/github'
			visit '/'
			visit '/signout'
			page.should have_content "You have been signed out!"
		end
	end
end