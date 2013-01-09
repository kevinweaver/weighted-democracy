require 'spec_helper'

describe "answers/edit" do
  before(:each) do
    @answer = assign(:answer, stub_model(Answer,
      :text => "MyText",
      :question_id => 1
    ))
  end

  it "renders the edit answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => answers_path(@answer), :method => "post" do
      assert_select "textarea#answer_text", :name => "answer[text]"
      assert_select "input#answer_question_id", :name => "answer[question_id]"
    end
  end
end
