require 'spec_helper'

describe "answers/edit" do
  before(:each) do
    @question = assign(:question, stub_model(Question,
      :id => 1))
    @answer = assign(:answer, stub_model(Answer,
      :text => "MyText",
      :question_id => 1
    ))
  end

  it "renders the edit answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => question_answers_path(@question), :method => "post" do
      assert_select "textarea#answer_text", :name => "answer[text]"
      assert_select "input#answer_question_id", :name => "answer[question_id]"
    end
  end
end
