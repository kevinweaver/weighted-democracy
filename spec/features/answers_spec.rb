require 'spec_helper'

describe "Answers" do
  it "works! (now write some real specs)" do
    capybara_login
    @question = create :question

    visit question_answers_path(@question)
    current_path.should eq question_answers_path(@question)
  end
end
