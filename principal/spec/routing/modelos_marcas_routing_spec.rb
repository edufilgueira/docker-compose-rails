# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ModelosMarcasController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/modelos_marcas').to route_to('modelos_marcas#index')
    end

    it 'routes to #new' do
      expect(get: '/modelos_marcas/new').to route_to('modelos_marcas#new')
    end

    it 'routes to #show' do
      expect(get: '/modelos_marcas/1').to route_to('modelos_marcas#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/modelos_marcas/1/edit').to route_to('modelos_marcas#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/modelos_marcas').to route_to('modelos_marcas#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/modelos_marcas/1').to route_to('modelos_marcas#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/modelos_marcas/1').to route_to('modelos_marcas#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/modelos_marcas/1').to route_to('modelos_marcas#destroy', id: '1')
    end
  end
end
