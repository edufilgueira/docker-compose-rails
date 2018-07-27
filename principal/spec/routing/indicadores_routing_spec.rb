# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IndicadoresController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/indicadores').to route_to('indicadores#index')
    end

    it 'routes to #new' do
      expect(get: '/indicadores/new').to route_to('indicadores#new')
    end

    it 'routes to #show' do
      expect(get: '/indicadores/1').to route_to('indicadores#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/indicadores/1/edit').to route_to('indicadores#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/indicadores').to route_to('indicadores#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/indicadores/1').to route_to('indicadores#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/indicadores/1').to route_to('indicadores#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/indicadores/1').to route_to('indicadores#destroy', id: '1')
    end
  end
end
