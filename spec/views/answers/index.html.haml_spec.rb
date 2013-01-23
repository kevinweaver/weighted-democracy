require 'spec_helper' 

describe "answers/index" do
  before(:each) do
    assign(:question,  
           stub_model(Question, 
           :id => 1))
    assign(:answers, [
      stub_model(Answer,
        :text => "MyText",
        :question_id => 1
      ),
      stub_model(Answer,
        :text => "MyText",
        :question_id => 1
      )
    ])
  end

  it "renders a list of answers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
