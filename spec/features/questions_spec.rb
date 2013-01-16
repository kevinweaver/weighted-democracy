require 'spec_helper'

describe "Questions" do
  describe "GET /questions" do
    it "works! (now write some real specs)" do
      capybara_login

      visit questions_path
      current_path.should eq(questions_path)
    end
  end
end
