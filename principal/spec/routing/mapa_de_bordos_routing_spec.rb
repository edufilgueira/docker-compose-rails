# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MapaDeBordosController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/mapa_de_bordos').to route_to('mapa_de_bordos#index')
    end

    it 'routes to #new' do
      expect(get: '/mapa_de_bordos/new').to route_to('mapa_de_bordos#new')
    end

    it 'routes to #show' do
      expect(get: '/mapa_de_bordos/1').to route_to('mapa_de_bordos#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/mapa_de_bordos/1/edit').to route_to('mapa_de_bordos#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/mapa_de_bordos').to route_to('mapa_de_bordos#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/mapa_de_bordos/1').to route_to('mapa_de_bordos#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/mapa_de_bordos/1').to route_to('mapa_de_bordos#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/mapa_de_bordos/1').to route_to('mapa_de_bordos#destroy', id: '1')
    end
  end
end
