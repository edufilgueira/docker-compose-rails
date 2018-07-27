require "rails_helper"

RSpec.describe Socioeduk::JovemCaracteristicasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/jovem_caracteristicas").to route_to("socioeduk/jovem_caracteristicas#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/jovem_caracteristicas/new").to route_to("socioeduk/jovem_caracteristicas#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/jovem_caracteristicas/1").to route_to("socioeduk/jovem_caracteristicas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/jovem_caracteristicas/1/edit").to route_to("socioeduk/jovem_caracteristicas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/jovem_caracteristicas").to route_to("socioeduk/jovem_caracteristicas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/jovem_caracteristicas/1").to route_to("socioeduk/jovem_caracteristicas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/jovem_caracteristicas/1").to route_to("socioeduk/jovem_caracteristicas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/jovem_caracteristicas/1").to route_to("socioeduk/jovem_caracteristicas#destroy", :id => "1")
    end

  end
end
