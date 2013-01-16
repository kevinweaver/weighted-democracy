require 'spec_helper'

describe "Disciplines" do
  describe "GET /disciplines" do
    it "works! (now write some real specs)" do
      capybara_login
      
      visit disciplines_path
      current_path.should eq(disciplines_path)
    end
  end
end
