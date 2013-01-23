require 'spec_helper'

describe "answers/show" do
  before(:each) do
    @question = assign(:question, stub_model(Question,
      :id => 1,
      :text => "What is the capital of Assyria?"))
    @answer = assign(:answer, stub_model(Answer,
      :text => "MyText",
      :question_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
