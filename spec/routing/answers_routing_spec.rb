require "spec_helper"

describe AnswersController do
  describe "routing" do
    it "routes to #index" do
      get("/questions/1/answers").should
        route_to({"action" => "index", "controller" => "answers", "question_id" => "1"})
    end

    it "routes to #new" do
      get("/questions/1/answers/new").should 
        route_to({"action" => "new", "controller" => "answers", "question_id" => "1"})
    end

    it "routes to #show" do
      get("/questions/1/answers/1").should
        route_to({"action" => "show", "controller" => "answers", "question_id" => "1"})
    end

    it "routes to #edit" do
      get("questions/1/answers/1/edit").should 
        route_to({"action" => "edit", "controller" => "answers", "question_id" => "1", :id => 1})
    end

    it "routes to #create" do
      post("/questions/1/answers").should
        route_to({"action" => "create", "controller" => "answers", "question_id" => "1"})
    end

    it "routes to #update" do
      put("/questions/1/answers/1").should
        route_to({"action" => "update", "controller" => "answers", "question_id" => "1"})
    end

    it "routes to #destroy" do
      delete("/questions/1/answer/1").should 
        route_to({"action" => "destroy", "controller" => "answers", "question_id" => "1", :id => 1})
    end

  end
end
