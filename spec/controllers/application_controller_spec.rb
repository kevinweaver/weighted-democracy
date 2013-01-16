require "spec_helper"

describe ApplicationController do

  describe "Authentication" do
    context "Normal User" do
      controller do
        def index
          render text: "WEEEEE"
        end
      end
      it "redirects to the login path when there is no user" do
        get :index
        response.should redirect_to login_path
      end

      it "doesn't redirect when there is a user" do
        user = create :user
        session[:user_id] = user.id
        get :index
        response.code.should eq "200"
      end
    end

  end
end
