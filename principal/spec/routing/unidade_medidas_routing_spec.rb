require "rails_helper"

RSpec.describe UnidadeMedidasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/unidade_medidas").to route_to("unidade_medidas#index")
    end

    it "routes to #new" do
      expect(:get => "/unidade_medidas/new").to route_to("unidade_medidas#new")
    end

    it "routes to #show" do
      expect(:get => "/unidade_medidas/1").to route_to("unidade_medidas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/unidade_medidas/1/edit").to route_to("unidade_medidas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/unidade_medidas").to route_to("unidade_medidas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/unidade_medidas/1").to route_to("unidade_medidas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/unidade_medidas/1").to route_to("unidade_medidas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/unidade_medidas/1").to route_to("unidade_medidas#destroy", :id => "1")
    end

  end
end
