require "rails_helper"

RSpec.describe Socioeduk::TipoCabelosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/tipo_cabelos").to route_to("socioeduk/tipo_cabelos#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/tipo_cabelos/new").to route_to("socioeduk/tipo_cabelos#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/tipo_cabelos/1").to route_to("socioeduk/tipo_cabelos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/tipo_cabelos/1/edit").to route_to("socioeduk/tipo_cabelos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/tipo_cabelos").to route_to("socioeduk/tipo_cabelos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/tipo_cabelos/1").to route_to("socioeduk/tipo_cabelos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/tipo_cabelos/1").to route_to("socioeduk/tipo_cabelos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/tipo_cabelos/1").to route_to("socioeduk/tipo_cabelos#destroy", :id => "1")
    end

  end
end
