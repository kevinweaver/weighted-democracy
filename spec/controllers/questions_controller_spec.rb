require 'spec_helper'


describe QuestionsController do
  
  def valid_session
    {}
  end

  before :each do
    @disc = create :discipline
  end
  it "ensures disciplines" do
    get :index
    expect(response).to redirect_to disciplines_path
  end

  describe "GET index" do
    it "assigns all questions as @questions" do
      question = create(:question, discipline_id: @disc.id)
      get :index, {discipline_id: @disc.id}, valid_session
      assigns(:questions).should eq([question])
    end
  end

  describe "GET show" do
    it "assigns the requested question as @question" do
      question = create(:question, discipline_id: @disc.id)
      get :show, {id: question.to_param, discipline_id: @disc.id}, valid_session
      assigns(:question).should eq(question)
    end
  end

  describe "GET new" do
    it "assigns a new question as @question" do
      get :new, {discipline_id: @disc.id}, valid_session
      assigns(:question).should be_a_new(Question)
    end
  end

  describe "GET edit" do
    it "assigns the requested question as @question" do
      question = create(:question, discipline_id: @disc.id)
      get :edit, {id: question.to_param, discipline_id: @disc.id}, valid_session
      assigns(:question).should eq(question)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Question" do
        expect {
          post :create, {question: attributes_for(:question), discipline_id: @disc.id}, valid_session
        }.to change(Question, :count).by(1)
      end

      it "assigns a newly created question as @question" do
        post :create, {:question => attributes_for(:question),discipline_id: @disc.id}, valid_session
        assigns(:question).should be_a(Question)
        assigns(:question).should be_persisted
      end

      it "redirects to the created question" do
        post :create, {:question => attributes_for(:question),discipline_id: @disc.id}, valid_session
        response.should redirect_to(Question.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved question as @question" do
        # Trigger the behavior that occurs when invalid params are submitted
        Question.any_instance.stub(:save).and_return(false)
        post :create, {:question => { "name" => "invalid value" },discipline_id: @disc.id}, valid_session
        assigns(:question).should be_a_new(Question)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Question.any_instance.stub(:save).and_return(false)
        post :create, {:question => { "name" => "invalid value" },discipline_id: @disc.id}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested question" do
        question = create(:question)
        # Assuming there are no other questions in the database, this
        # specifies that the Question created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Question.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => question.to_param, :question => { "name" => "MyString" },discipline_id: @disc.id}, valid_session
      end

      it "assigns the requested question as @question" do
        question = create(:question)
        put :update, {:id => question.to_param, :question => attributes_for(:question),discipline_id: @disc.id}, valid_session
        assigns(:question).should eq(question)
      end

      it "redirects to the question" do
        question = create(:question)
        put :update, {:id => question.to_param, :question => attributes_for(:question),discipline_id: @disc.id}, valid_session
        response.should redirect_to(question)
      end
    end

    describe "with invalid params" do
      it "assigns the question as @question" do
        question = create(:question)
        # Trigger the behavior that occurs when invalid params are submitted
        Question.any_instance.stub(:save).and_return(false)
        put :update, {:id => question.to_param, :question => { "name" => "invalid value" },discipline_id: @disc.id}, valid_session
        assigns(:question).should eq(question)
      end

      it "re-renders the 'edit' template" do
        question = create(:question)
        # Trigger the behavior that occurs when invalid params are submitted
        Question.any_instance.stub(:save).and_return(false)
        put :update, {:id => question.to_param, :question => { "name" => "invalid value" },discipline_id: @disc.id}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested question" do
      question = create(:question)
      expect {
        delete :destroy, {:id => question.to_param,discipline_id: @disc.id}, valid_session
      }.to change(Question, :count).by(-1)
    end

    it "redirects to the questions list" do
      question = create(:question)
      delete :destroy, {:id => question.to_param,discipline_id: @disc.id}, valid_session
      response.should redirect_to(questions_url)
    end
  end

end
