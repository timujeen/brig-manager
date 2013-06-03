require "spec_helper"

describe JobsController do
  describe "routing" do

    it "routes to #index" do
      get("/jobs").should route_to("jobs#index")
    end

    it "routes to #destroy" do
      delete("/jobs/1").should route_to("jobs#destroy", :id => "1")
    end

  end
end
