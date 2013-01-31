require 'spec_helper'

describe "questions/show" do
  before(:each) do
    @question = assign(:question, stub_model(Question,
      :name => "Name",
      :text => "MyText"
    ))
    @question.stub(:answers).and_return([
      stub_model(Answer,
                 :text => "AnswerText"),
      stub_model(Answer,
                 :text => "AnswerText")])
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    assert_select "tr>td", :text => "AnswerText".to_s, :count => 2
  end
end
