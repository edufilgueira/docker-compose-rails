require "rails_helper"

RSpec.describe Socioeduk::CorOlhosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/cor_olhos").to route_to("socioeduk/cor_olhos#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/cor_olhos/new").to route_to("socioeduk/cor_olhos#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/cor_olhos/1").to route_to("socioeduk/cor_olhos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/cor_olhos/1/edit").to route_to("socioeduk/cor_olhos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/cor_olhos").to route_to("socioeduk/cor_olhos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/cor_olhos/1").to route_to("socioeduk/cor_olhos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/cor_olhos/1").to route_to("socioeduk/cor_olhos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/cor_olhos/1").to route_to("socioeduk/cor_olhos#destroy", :id => "1")
    end

  end
end
