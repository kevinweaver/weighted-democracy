require 'spec_helper'

describe "answers/new" do
  before(:each) do
    @question = assign(:question, stub_model(Question,
      :id => 1))
    assign(:answer, stub_model(Answer,
      :text => "MyText",
      :question_id => 1
    ).as_new_record)
  end

  it "renders new answer form" do
    render

    assert_select "form", :action => question_answers_path(@question.id), :method => "post" do
      assert_select "textarea#answer_text", :name => "answer[text]"
      assert_select "input#answer_question_id", :name => "answer[question_id]"
    end
  end
end
