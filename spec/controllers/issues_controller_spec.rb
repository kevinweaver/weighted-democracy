require 'spec_helper'
describe IssuesController do

  describe "GET index" do
    it "assigns all issues as @issues" do
      issue = create(:issue)
      get :index, {}, valid_session
      assigns(:issues).should eq([issue])
    end
  end

  describe "GET show" do
    it "assigns the requested issue as @issue" do
      issue = create :issue
      get :show, {:id => issue.to_param}, valid_session
      assigns(:issue).should eq(issue)
    end
  end

  describe "GET new" do
    it "assigns a new issue as @issue" do
      get :new, {}, valid_session
      assigns(:issue).should be_a_new(Issue)
    end
  end

  describe "GET edit" do
    it "assigns the requested issue as @issue" do
      issue = create :issue
      get :edit, {:id => issue.to_param}, valid_session
      assigns(:issue).should eq(issue)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Issue" do
        expect {
          post :create, {:issue => attributes_for(:issue)}, valid_session
        }.to change(Issue, :count).by(1)
      end

      it "assigns a newly created issue as @issue" do
        post :create, {:issue => attributes_for(:issue)}, valid_session
        assigns(:issue).should be_a(Issue)
        assigns(:issue).should be_persisted
      end

      it "redirects to the created issue" do
        post :create, {:issue => attributes_for(:issue)}, valid_session
        response.should redirect_to(Issue.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved issue as @issue" do
        # Trigger the behavior that occurs when invalid params are submitted
        Issue.any_instance.stub(:save).and_return(false)
        post :create, {:issue => { "name" => "invalid value" }}, valid_session
        assigns(:issue).should be_a_new(Issue)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Issue.any_instance.stub(:save).and_return(false)
        post :create, {:issue => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested issue" do
        issue = create :issue
        # Assuming there are no other issues in the database, this
        # specifies that the Issue created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Issue.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => issue.to_param, :issue => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested issue as @issue" do
        issue = create :issue
        put :update, {:id => issue.to_param, :issue => attributes_for(:issue)}, valid_session
        assigns(:issue).should eq(issue)
      end

      it "redirects to the issue" do
        issue = create :issue
        put :update, {:id => issue.to_param, :issue => attributes_for(:issue)}, valid_session
        response.should redirect_to(issue)
      end
    end

    describe "with invalid params" do
      it "assigns the issue as @issue" do
        issue = create :issue
        # Trigger the behavior that occurs when invalid params are submitted
        Issue.any_instance.stub(:save).and_return(false)
        put :update, {:id => issue.to_param, :issue => { "name" => "invalid value" }}, valid_session
        assigns(:issue).should eq(issue)
      end

      it "re-renders the 'edit' template" do
        issue = create :issue
        # Trigger the behavior that occurs when invalid params are submitted
        Issue.any_instance.stub(:save).and_return(false)
        put :update, {:id => issue.to_param, :issue => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested issue" do
      issue = create :issue
      expect {
        delete :destroy, {:id => issue.to_param}, valid_session
      }.to change(Issue, :count).by(-1)
    end

    it "redirects to the issues list" do
      issue = create :issue
      delete :destroy, {:id => issue.to_param}, valid_session
      response.should redirect_to(issues_url)
    end
  end

end
