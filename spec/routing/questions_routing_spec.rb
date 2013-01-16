require "spec_helper"

describe QuestionsController do
  describe "routing" do

    it "routes to #index" do
      get("/questions").should route_to("questions#index")
    end

    it "routes to #new" do
      get("/questions/new").should route_to("questions#new")
    end

    it "routes to #show" do
      get("/questions/1").should route_to("questions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/questions/1/edit").should route_to("questions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/questions").should route_to("questions#create")
    end

    it "routes to #update" do
      put("/questions/1").should route_to("questions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/questions/1").should route_to("questions#destroy", :id => "1")
    end

    it "routes to discipline/1/questions" do
      get("disciplines/1/questions").should route_to("questions#index", "discipline_id" => "1")
    end

    it "routes to discpline/1/questons/new" do
      get("disciplines/1/questions/new").should route_to("questions#new", "discipline_id" => "1")
    end

    it "routes to discipline/1/questions/show" do
      get("disciplines/1/questions/1").should route_to("questions#show", :id => "1", "discipline_id" => "1")
    end

    it "routes to disciplines/1/questions/1/edit" do
      get("/disciplines/1/questions/1/edit").should route_to("questions#edit", :id => "1", "discipline_id" => "1")
    end

    it "routes to disciplines/1/questions/create" do
      post("/disciplines/1/questions").should route_to("questions#create", "discipline_id" => "1")
    end

    
  end
end
