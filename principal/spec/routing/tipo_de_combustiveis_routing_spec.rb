# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TipoDeCombustiveisController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/tipo_de_combustiveis').to route_to('tipo_de_combustiveis#index')
    end

    it 'routes to #new' do
      expect(get: '/tipo_de_combustiveis/new').to route_to('tipo_de_combustiveis#new')
    end

    it 'routes to #show' do
      expect(get: '/tipo_de_combustiveis/1').to route_to('tipo_de_combustiveis#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/tipo_de_combustiveis/1/edit').to route_to('tipo_de_combustiveis#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/tipo_de_combustiveis').to route_to('tipo_de_combustiveis#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/tipo_de_combustiveis/1').to route_to('tipo_de_combustiveis#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/tipo_de_combustiveis/1').to route_to('tipo_de_combustiveis#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/tipo_de_combustiveis/1').to route_to('tipo_de_combustiveis#destroy', id: '1')
    end
  end
end
