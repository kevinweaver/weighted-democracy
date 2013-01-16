require 'spec_helper'

describe "sessions/new" do
 
  it "renders new session form" do
    render

    assert_select "form[action=?][method='post']", login_path do 
      assert_select "label.name", :name => "email", :text => "Email"
      assert_select "input#email", :name => "email"
      assert_select "label.password", :name => "password", :text => "Password"
      assert_select "input#password", :name => "password"
      assert_select "button#submit", :text => "Submit"
    end
  end

end
