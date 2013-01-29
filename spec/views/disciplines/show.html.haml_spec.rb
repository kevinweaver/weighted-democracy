require 'spec_helper'

describe "disciplines/show" do
  before(:each) do
    @discipline = assign(:discipline, stub_model(Discipline,
      :name => "Name",
      :description => "MyText"
    ))
    @discipline.stub(:questions).and_return([
      stub_model(Question,
                 :name => "QuestionName",
                 :text => "QuestionText"),
      stub_model(Question,
                 :name => "QuestionName",
                 :text => "QuestionText")])
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    assert_select "tr>td", :text => "QuestionName".to_s, :count => 2
    assert_select "tr>td", :text => "QuestionText".to_s, :count => 2
  end
end
