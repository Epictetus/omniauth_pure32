require 'spec_helper'

describe "Sign In" do
  describe "GET /signin" do
    it "should get the signin path" do
      get signin_path
      response.status.should be(200)
    end
  end
  
  describe "I should need to authenticate if I click the link" do
    it "should show me the link" do
      visit '/'
      page.should have_content("click here")
    end
    
    it "should make me sign in if I click the link" do
      visit '/'
      click_link "click here"
      page.should have_content("You need to sign in before accessing this page!")
    end
  end
  
  
end
