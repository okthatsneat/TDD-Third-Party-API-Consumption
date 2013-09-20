require "spec_helper"

describe UserRequestsController do
  describe "routing" do

    it "routes to #index" do
      get("/user_requests").should route_to("user_requests#index")
    end

    it "routes to #new" do
      get("/user_requests/new").should route_to("user_requests#new")
    end

    it "routes to #show" do
      get("/user_requests/1").should route_to("user_requests#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_requests/1/edit").should route_to("user_requests#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_requests").should route_to("user_requests#create")
    end

    it "routes to #update" do
      put("/user_requests/1").should route_to("user_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_requests/1").should route_to("user_requests#destroy", :id => "1")
    end

  end
end
