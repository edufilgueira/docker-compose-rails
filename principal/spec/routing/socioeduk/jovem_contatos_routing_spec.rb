require "rails_helper"

RSpec.describe Socioeduk::JovemContatosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/jovem_contatos").to route_to("socioeduk/jovem_contatos#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/jovem_contatos/new").to route_to("socioeduk/jovem_contatos#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/jovem_contatos/1").to route_to("socioeduk/jovem_contatos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/jovem_contatos/1/edit").to route_to("socioeduk/jovem_contatos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/jovem_contatos").to route_to("socioeduk/jovem_contatos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/jovem_contatos/1").to route_to("socioeduk/jovem_contatos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/jovem_contatos/1").to route_to("socioeduk/jovem_contatos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/jovem_contatos/1").to route_to("socioeduk/jovem_contatos#destroy", :id => "1")
    end

  end
end
