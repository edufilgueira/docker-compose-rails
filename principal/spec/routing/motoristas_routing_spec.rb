require "rails_helper"

RSpec.describe MotoristasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/motoristas").to route_to("motoristas#index")
    end

    it "routes to #new" do
      expect(:get => "/motoristas/new").to route_to("motoristas#new")
    end

    it "routes to #show" do
      expect(:get => "/motoristas/1").to route_to("motoristas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/motoristas/1/edit").to route_to("motoristas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/motoristas").to route_to("motoristas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/motoristas/1").to route_to("motoristas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/motoristas/1").to route_to("motoristas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/motoristas/1").to route_to("motoristas#destroy", :id => "1")
    end

  end
end
