require 'spec_helper'

describe "TWITTER Services" do

  before do
    u = User.find_or_create_by_name(:name => "Joe Public", :email => "joe@example.com",
                                    :password => "secret123", :password_confirmation => "secret123")

    s = Service.find_or_initialize_by_user_id( :user_id => u.id, :provider => 'twitter',
                                           :uid => '44444', :uname => 'Joe Public',
                                           :uemail => "joe@example.com")
    s.user_id = u.id
    s.save
  end

  describe "GET /auth/twitter" do
    it "works!" do
      visit '/auth/twitter'
      page.should have_content "There was an error at the remote authentication service. You have not been signed in."
    end
  end

  describe "GET /users/test" do
	  it "should show the secret page" do
		  visit "/auth/twitter"
		  visit "/users/test"
		  page.should have_content "You need to sign in before accessing this page!"
	  end
  end

end