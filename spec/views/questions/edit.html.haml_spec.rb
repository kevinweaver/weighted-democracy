require 'spec_helper'

describe "questions/edit" do
  before(:each) do
    @question = assign(:question, stub_model(Question,
      :name => "MyString",
      :text => "MyText"
    ))
  end

  it "renders the edit question form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => discipline_questions_path(@question), :method => "post" do
      assert_select "input#question_name", :name => "question[name]"
      assert_select "textarea#question_text", :name => "question[text]"
    end
  end
end
