# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MarcaVeiculosController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/marca_veiculos').to route_to('marca_veiculos#index')
    end

    it 'routes to #new' do
      expect(get: '/marca_veiculos/new').to route_to('marca_veiculos#new')
    end

    it 'routes to #show' do
      expect(get: '/marca_veiculos/1').to route_to('marca_veiculos#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/marca_veiculos/1/edit').to route_to('marca_veiculos#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/marca_veiculos').to route_to('marca_veiculos#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/marca_veiculos/1').to route_to('marca_veiculos#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/marca_veiculos/1').to route_to('marca_veiculos#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/marca_veiculos/1').to route_to('marca_veiculos#destroy', id: '1')
    end
  end
end
