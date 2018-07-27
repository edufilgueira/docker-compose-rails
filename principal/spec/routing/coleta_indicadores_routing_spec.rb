# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ColetaIndicadoresController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/coleta_indicadores').to route_to('coleta_indicadores#index')
    end

    it 'routes to #new' do
      expect(get: '/coleta_indicadores/new').to route_to('coleta_indicadores#new')
    end

    it 'routes to #show' do
      expect(get: '/coleta_indicadores/1').to route_to('coleta_indicadores#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/coleta_indicadores/1/edit').to route_to('coleta_indicadores#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/coleta_indicadores').to route_to('coleta_indicadores#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/coleta_indicadores/1').to route_to('coleta_indicadores#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/coleta_indicadores/1').to route_to('coleta_indicadores#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/coleta_indicadores/1').to route_to('coleta_indicadores#destroy', id: '1')
    end
  end
end
