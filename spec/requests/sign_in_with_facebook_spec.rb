require 'spec_helper'

describe "SignInWithFacebook" do
  
  before do
    u = User.find_or_create_by_name(:name => "Joe Public", :email => "joe@example.com")
    s = Service.find_or_create_by_user_id( :provider => 'facebook', :uid => '12345', 
                                                    :uname => 'JQP', :uemail => "joe@example.com",
                                                    :user_id => u.id)
  end
  
  describe "GET /auth/facebook" do
    it "works!" do
      visit '/auth/facebook'
      page.should have_content "joe@example.com"
    end
  end
end
