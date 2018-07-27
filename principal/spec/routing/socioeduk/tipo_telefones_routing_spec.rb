require "rails_helper"

RSpec.describe Socioeduk::TipoTelefonesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/tipo_telefones").to route_to("socioeduk/tipo_telefones#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/tipo_telefones/new").to route_to("socioeduk/tipo_telefones#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/tipo_telefones/1").to route_to("socioeduk/tipo_telefones#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/tipo_telefones/1/edit").to route_to("socioeduk/tipo_telefones#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/tipo_telefones").to route_to("socioeduk/tipo_telefones#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/tipo_telefones/1").to route_to("socioeduk/tipo_telefones#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/tipo_telefones/1").to route_to("socioeduk/tipo_telefones#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/tipo_telefones/1").to route_to("socioeduk/tipo_telefones#destroy", :id => "1")
    end

  end
end
