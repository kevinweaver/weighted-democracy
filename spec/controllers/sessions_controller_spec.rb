require 'spec_helper'

describe SessionsController do
  describe "GET new" do
    it "renders the login page" do
     get :new
     response.should render_template("new")
    end
  end

  describe "POST create" do
    context "with valid credentials" do
      before :each do
        @user = create :user
        post :create, {email: @user.email, password: "secret"}
      end

      it "finds the user based on email" do
        assigns(:user).should eq @user
      end

      it "sets session[:user_id]" do
        session[:user_id].should eq @user.id
      end

      it "redirects to root url" do
        response.should redirect_to(root_path)  
      end
    end

    context "with invalid password" do
      it "re-renders the login form" do
        @user = create :user 
        post :create, {email: @user.email, password: "wrong_password"}
        response.should redirect_to(login_path)
      end
    end

    context "with invalid email" do
      it "re-renders the login form" do
        post :create, {email: "no_email", password: "secret"}
        response.should redirect_to(login_path)
      end
    end
  end

  describe "GET destroy" do
    it "redirects to login page" do
      get :destroy
      response.should redirect_to(login_path)
    end

    it "clears session[:user_id]" do
      session[:user_id] = 1
      get :destroy
      expect(session[:user_id]).to be_nil
    end
  end
end
