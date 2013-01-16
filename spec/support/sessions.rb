module SessionHelper
  def valid_session
    {user_id: 1}
  end

  def capybara_login
    @user = create :user
    visit login_path
    fill_in "email", with: @user.email
    fill_in "password", with: "secret"
    click_button "Submit"
  end
end
