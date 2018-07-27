require "rails_helper"

RSpec.describe Socioeduk::SituacaoAdolescentesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/situacao_adolescentes").to route_to("socioeduk/situacao_adolescentes#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/situacao_adolescentes/new").to route_to("socioeduk/situacao_adolescentes#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/situacao_adolescentes/1").to route_to("socioeduk/situacao_adolescentes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/situacao_adolescentes/1/edit").to route_to("socioeduk/situacao_adolescentes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/situacao_adolescentes").to route_to("socioeduk/situacao_adolescentes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/situacao_adolescentes/1").to route_to("socioeduk/situacao_adolescentes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/situacao_adolescentes/1").to route_to("socioeduk/situacao_adolescentes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/situacao_adolescentes/1").to route_to("socioeduk/situacao_adolescentes#destroy", :id => "1")
    end

  end
end
