require 'spec_helper'

describe "disciplines/edit" do
  before(:each) do
    @discipline = assign(:discipline, stub_model(Discipline,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit discipline form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => disciplines_path(@discipline), :method => "post" do
      assert_select "input#discipline_name", :name => "discipline[name]"
      assert_select "textarea#discipline_description", :name => "discipline[description]"
    end
  end
end
