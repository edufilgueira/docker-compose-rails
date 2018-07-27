# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TipoPatrimoniosController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/tipo_patrimonios').to route_to('tipo_patrimonios#index')
    end

    it 'routes to #new' do
      expect(get: '/tipo_patrimonios/new').to route_to('tipo_patrimonios#new')
    end

    it 'routes to #show' do
      expect(get: '/tipo_patrimonios/1').to route_to('tipo_patrimonios#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/tipo_patrimonios/1/edit').to route_to('tipo_patrimonios#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/tipo_patrimonios').to route_to('tipo_patrimonios#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/tipo_patrimonios/1').to route_to('tipo_patrimonios#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/tipo_patrimonios/1').to route_to('tipo_patrimonios#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/tipo_patrimonios/1').to route_to('tipo_patrimonios#destroy', id: '1')
    end
  end
end
