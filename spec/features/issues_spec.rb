require 'spec_helper'

describe "Issues" do
  describe "GET /issues" do
    it "works! (now write some real specs)" do
      capybara_login
      visit issues_path
      current_path.should eq issues_path
    end
  end
end
