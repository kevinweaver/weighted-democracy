require 'spec_helper'

feature "User Creation:" do
  scenario "unregistered user tries to create an account" do
    visit new_user_path
    current_path.should eq(new_user_path)

    fill_in "user_first_name", with: "werp_first_name"
    fill_in "user_last_name", with: "last_name"
    fill_in "user_email", with: "email@example.com"
    fill_in "user_password", with: "secret"
    fill_in "user_password_confirmation", with: "secret"

    click_button "Save"
    current_path.should eq(login_path)

    User.last.first_name = "werp_first_name"

  end

  scenario "admin adds a user"
end
