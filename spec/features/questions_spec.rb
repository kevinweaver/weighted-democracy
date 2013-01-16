require 'spec_helper'

describe "Questions" do
  describe "GET /questions" do
    it "works! (now write some real specs)" do
      capybara_login
      question = create(:question)
      discipline = create(:discipline)

      visit discipline_questions_path(discipline)

      current_path.should eq discipline_questions_path(discipline)
    end
  end
end
