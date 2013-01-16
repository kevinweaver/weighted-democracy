require 'spec_helper'

describe "Answers" do
  it "works! (now write some real specs)" do
    capybara_login

    visit answers_path
    current_path.should eq answers_path
  end
end
