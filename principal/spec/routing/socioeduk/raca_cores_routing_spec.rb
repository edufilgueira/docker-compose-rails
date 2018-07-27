require "rails_helper"

RSpec.describe Socioeduk::RacaCoresController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/raca_cores").to route_to("socioeduk/raca_cores#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/raca_cores/new").to route_to("socioeduk/raca_cores#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/raca_cores/1").to route_to("socioeduk/raca_cores#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/raca_cores/1/edit").to route_to("socioeduk/raca_cores#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/raca_cores").to route_to("socioeduk/raca_cores#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/raca_cores/1").to route_to("socioeduk/raca_cores#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/raca_cores/1").to route_to("socioeduk/raca_cores#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/raca_cores/1").to route_to("socioeduk/raca_cores#destroy", :id => "1")
    end

  end
end
