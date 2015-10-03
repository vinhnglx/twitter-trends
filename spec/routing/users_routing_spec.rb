require "rails_helper"

RSpec.describe "Routes for Users", :type => :routing do

  context "root path" do

    it "returns to queries index page" do
      expect(get: root_path).to route_to(controller: "queries", action: "index")
    end

  end

  context "results path" do

    it "returns to queries show page" do
      expect(get: results_path).to route_to(controller: "queries",
        action: "show")
    end

  end

  context "create user path" do

    it "routes from twitter callback url to user#create" do
      expect(get: "/auth/twitter/callback").to route_to(controller: "users",
        action: "create", provider: "twitter")
    end

    it "does not route to /users" do
      expect(post: "/users").not_to be_routable
    end

  end

  context "delete session" do

    it "routes from logout url to user#create" do
      expect(delete: "/logout").to route_to(controller: "users",
        action: "destroy")
    end

    it "does not route to /users" do
      expect(delete: "/users").not_to be_routable
    end

  end

end
