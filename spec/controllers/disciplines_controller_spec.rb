require 'spec_helper'

describe DisciplinesController do
  before :each do
    @issue = create :issue
  end

  it "ensures issue" do
    get :index, {}, valid_session
    expect(response).to redirect_to issues_path
  end

  describe "GET index" do
    it "assigns all disciplines as @disciplines" do
      discipline = create(:discipline, issue_id: @issue.id)
      get :index, {issue_id: @issue.id}, valid_session
      assigns(:disciplines).should eq([discipline])
    end
  end

  describe "GET show" do
    xit "assigns the requested discipline as @discipline" do
      discipline = create(:discipline)
      get :show, {:id => discipline.to_param}, valid_session
      assigns(:discipline).should eq(discipline)
    end
  end

  describe "GET new" do
    xit "assigns a new discipline as @discipline" do
      get :new, {}, valid_session
      assigns(:discipline).should be_a_new(Discipline)
    end
  end

  describe "GET edit" do
    xit "assigns the requested discipline as @discipline" do
      discipline = create(:discipline)
      get :edit, {:id => discipline.to_param}, valid_session
      assigns(:discipline).should eq(discipline)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      xit "creates a new Discipline" do
        expect {
          post :create, {:discipline =>  attributes_for(:discipline)}, valid_session
        }.to change(Discipline, :count).by(1)
      end

      xit "assigns a newly created discipline as @discipline" do
        post :create, {:discipline =>  attributes_for(:discipline)}, valid_session
        assigns(:discipline).should be_a(Discipline)
        assigns(:discipline).should be_persisted
      end

      xit "redirects to the created discipline" do
        post :create, {:discipline =>  attributes_for(:discipline)}, valid_session
        response.should redirect_to(Discipline.last)
      end
    end

    describe "with invalid params" do
      xit "assigns a newly created but unsaved discipline as @discipline" do
        # Trigger the behavior that occurs when invalid params are submitted
        Discipline.any_instance.stub(:save).and_return(false)
        post :create, {:discipline => { "name" => "invalid value" }}, valid_session
        assigns(:discipline).should be_a_new(Discipline)
      end

      xit "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Discipline.any_instance.stub(:save).and_return(false)
        post :create, {:discipline => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      xit "updates the requested discipline" do
        discipline = create(:discipline)
        # Assuming there are no other disciplines in the database, this
        # specifies that the Discipline created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Discipline.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => discipline.to_param, :discipline => { "name" => "MyString" }}, valid_session
      end

      xit "assigns the requested discipline as @discipline" do
        discipline = create(:discipline)
        put :update, {:id => discipline.to_param, :discipline => attributes_for(:discipline)}, valid_session
        assigns(:discipline).should eq(discipline)
      end

      xit "redirects to the discipline" do
        discipline = create(:discipline)
        put :update, {:id => discipline.to_param, :discipline => attributes_for(:discipline)}, valid_session
        response.should redirect_to(discipline)
      end
    end

    describe "with invalid params" do
      xit "assigns the discipline as @discipline" do
        discipline = create(:discipline)
        # Trigger the behavior that occurs when invalid params are submitted
        Discipline.any_instance.stub(:save).and_return(false)
        put :update, {:id => discipline.to_param, :discipline => { "name" => "invalid value" }}, valid_session
        assigns(:discipline).should eq(discipline)
      end

      xit "re-renders the 'edit' template" do
        discipline = create(:discipline)
        # Trigger the behavior that occurs when invalid params are submitted
        Discipline.any_instance.stub(:save).and_return(false)
        put :update, {:id => discipline.to_param, :discipline => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    xit "destroys the requested discipline" do
      discipline = create(:discipline)
      expect {
        delete :destroy, {:id => discipline.to_param}, valid_session
      }.to change(Discipline, :count).by(-1)
    end

    xit "redirects to the disciplines list" do
      discipline = create(:discipline)
      delete :destroy, {:id => discipline.to_param}, valid_session
      response.should redirect_to(disciplines_url)
    end
  end

end
