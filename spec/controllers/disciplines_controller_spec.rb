require 'spec_helper'


describe DisciplinesController do


  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all disciplines as @disciplines" do
      discipline = create(:discipline)
      get :index, {}, valid_session
      assigns(:disciplines).should eq([discipline])
    end
  end

  describe "GET show" do
    it "assigns the requested discipline as @discipline" do
      discipline = create(:discipline)
      get :show, {:id => discipline.to_param}, valid_session
      assigns(:discipline).should eq(discipline)
    end
  end

  describe "GET new" do
    it "assigns a new discipline as @discipline" do
      get :new, {}, valid_session
      assigns(:discipline).should be_a_new(Discipline)
    end
  end

  describe "GET edit" do
    it "assigns the requested discipline as @discipline" do
      discipline = create(:discipline)
      get :edit, {:id => discipline.to_param}, valid_session
      assigns(:discipline).should eq(discipline)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Discipline" do
        expect {
          post :create, {:discipline =>  attributes_for(:discipline)}, valid_session
        }.to change(Discipline, :count).by(1)
      end

      it "assigns a newly created discipline as @discipline" do
        post :create, {:discipline =>  attributes_for(:discipline)}, valid_session
        assigns(:discipline).should be_a(Discipline)
        assigns(:discipline).should be_persisted
      end

      it "redirects to the created discipline" do
        post :create, {:discipline =>  attributes_for(:discipline)}, valid_session
        response.should redirect_to(Discipline.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved discipline as @discipline" do
        # Trigger the behavior that occurs when invalid params are submitted
        Discipline.any_instance.stub(:save).and_return(false)
        post :create, {:discipline => { "name" => "invalid value" }}, valid_session
        assigns(:discipline).should be_a_new(Discipline)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Discipline.any_instance.stub(:save).and_return(false)
        post :create, {:discipline => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested discipline" do
        discipline = create(:discipline)
        # Assuming there are no other disciplines in the database, this
        # specifies that the Discipline created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Discipline.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => discipline.to_param, :discipline => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested discipline as @discipline" do
        discipline = create(:discipline)
        put :update, {:id => discipline.to_param, :discipline => attributes_for(:discipline)}, valid_session
        assigns(:discipline).should eq(discipline)
      end

      it "redirects to the discipline" do
        discipline = create(:discipline)
        put :update, {:id => discipline.to_param, :discipline => attributes_for(:discipline)}, valid_session
        response.should redirect_to(discipline)
      end
    end

    describe "with invalid params" do
      it "assigns the discipline as @discipline" do
        discipline = create(:discipline)
        # Trigger the behavior that occurs when invalid params are submitted
        Discipline.any_instance.stub(:save).and_return(false)
        put :update, {:id => discipline.to_param, :discipline => { "name" => "invalid value" }}, valid_session
        assigns(:discipline).should eq(discipline)
      end

      it "re-renders the 'edit' template" do
        discipline = create(:discipline)
        # Trigger the behavior that occurs when invalid params are submitted
        Discipline.any_instance.stub(:save).and_return(false)
        put :update, {:id => discipline.to_param, :discipline => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested discipline" do
      discipline = create(:discipline)
      expect {
        delete :destroy, {:id => discipline.to_param}, valid_session
      }.to change(Discipline, :count).by(-1)
    end

    it "redirects to the disciplines list" do
      discipline = create(:discipline)
      delete :destroy, {:id => discipline.to_param}, valid_session
      response.should redirect_to(disciplines_url)
    end
  end

end
