require 'spec_helper'

describe "Sign Out" do
  describe "GET /signout" do
    it "works!" do
      visit('/signout')
      current_path.should == root_path
    end
  end
end
