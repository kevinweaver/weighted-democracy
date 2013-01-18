require 'spec_helper'


describe AnswersController do
  before :each do
    @question = create :question
  end

  it "ensures questions" do
    get :index, {}, valid_session
    expect(response).to redirect_to questions_path
  end

  describe "GET index" do
    it "assigns all answers as @answers" do
      answer = create(:answer)
      get :index, {}, valid_session
      assigns(:answers).should eq([answer])
    end
  end

  describe "GET show" do
    it "assigns the requested answer as @answer" do
      answer = create(:answer)
      get :show, {:id => answer.to_param}, valid_session
      assigns(:answer).should eq(answer)
    end
  end

  describe "GET new" do
    it "assigns a new answer as @answer" do
      get :new, {}, valid_session
      assigns(:answer).should be_a_new(Answer)
    end
  end

  describe "GET edit" do
    it "assigns the requested answer as @answer" do
      answer = create(:answer)
      get :edit, {:id => answer.to_param}, valid_session
      assigns(:answer).should eq(answer)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Answer" do
        expect {
          post :create, {:answer => attributes_for(:answer)}, valid_session
        }.to change(Answer, :count).by(1)
      end

      it "assigns a newly created answer as @answer" do
        post :create, {:answer => attributes_for(:answer)}, valid_session
        assigns(:answer).should be_a(Answer)
        assigns(:answer).should be_persisted
      end

      it "redirects to the created answer" do
        post :create, {:answer => attributes_for(:answer)}, valid_session
        response.should redirect_to(Answer.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved answer as @answer" do
        # Trigger the behavior that occurs when invalid params are submitted
        Answer.any_instance.stub(:save).and_return(false)
        post :create, {:answer => { "text" => "invalid value" }}, valid_session
        assigns(:answer).should be_a_new(Answer)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Answer.any_instance.stub(:save).and_return(false)
        post :create, {:answer => { "text" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested answer" do
        answer = create(:answer)
        # Assuming there are no other answers in the database, this
        # specifies that the Answer created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Answer.any_instance.should_receive(:update_attributes).with({ "text" => "MyText" })
        put :update, {:id => answer.to_param, :answer => { "text" => "MyText" }}, valid_session
      end

      it "assigns the requested answer as @answer" do
        answer = create(:answer)
        put :update, {:id => answer.to_param, :answer => attributes_for(:answer)}, valid_session
        assigns(:answer).should eq(answer)
      end

      it "redirects to the answer" do
        answer = create(:answer)
        put :update, {:id => answer.to_param, :answer => attributes_for(:answer)}, valid_session
        response.should redirect_to(answer)
      end
    end

    describe "with invalid params" do
      it "assigns the answer as @answer" do
        answer = create(:answer)
        # Trigger the behavior that occurs when invalid params are submitted
        Answer.any_instance.stub(:save).and_return(false)
        put :update, {:id => answer.to_param, :answer => { "text" => "invalid value" }}, valid_session
        assigns(:answer).should eq(answer)
      end

      it "re-renders the 'edit' template" do
        answer = create(:answer)
        # Trigger the behavior that occurs when invalid params are submitted
        Answer.any_instance.stub(:save).and_return(false)
        put :update, {:id => answer.to_param, :answer => { "text" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested answer" do
      answer = create(:answer)
      expect {
        delete :destroy, {:id => answer.to_param}, valid_session
      }.to change(Answer, :count).by(-1)
    end

    it "redirects to the answers list" do
      answer = create(:answer)
      delete :destroy, {:id => answer.to_param}, valid_session
      response.should redirect_to(answers_url)
    end
  end

end
