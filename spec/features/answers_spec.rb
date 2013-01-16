require 'spec_helper'

describe "Answers" do
    it "works! (now write some real specs)" do
      user = create :user
      visit login_path
      fill_in "email", with: user.email
      fill_in "password", with: "secret"
      click_button "Submit"
      current_path.should eq root_path
    end
end
