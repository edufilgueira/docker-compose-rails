require "rails_helper"

RSpec.describe RegioesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/regioes").to route_to("regioes#index")
    end

    it "routes to #new" do
      expect(:get => "/regioes/new").to route_to("regioes#new")
    end

    it "routes to #show" do
      expect(:get => "/regioes/1").to route_to("regioes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/regioes/1/edit").to route_to("regioes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/regioes").to route_to("regioes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/regioes/1").to route_to("regioes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/regioes/1").to route_to("regioes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/regioes/1").to route_to("regioes#destroy", :id => "1")
    end

  end
end
