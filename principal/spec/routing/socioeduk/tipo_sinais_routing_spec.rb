require "rails_helper"

RSpec.describe Socioeduk::TipoSinaisController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/tipo_sinais").to route_to("socioeduk/tipo_sinais#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/tipo_sinais/new").to route_to("socioeduk/tipo_sinais#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/tipo_sinais/1").to route_to("socioeduk/tipo_sinais#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/tipo_sinais/1/edit").to route_to("socioeduk/tipo_sinais#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/tipo_sinais").to route_to("socioeduk/tipo_sinais#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/tipo_sinais/1").to route_to("socioeduk/tipo_sinais#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/tipo_sinais/1").to route_to("socioeduk/tipo_sinais#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/tipo_sinais/1").to route_to("socioeduk/tipo_sinais#destroy", :id => "1")
    end

  end
end
