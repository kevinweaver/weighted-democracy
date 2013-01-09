require 'spec_helper'

describe "disciplines/show" do
  before(:each) do
    @discipline = assign(:discipline, stub_model(Discipline,
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
  end
end
