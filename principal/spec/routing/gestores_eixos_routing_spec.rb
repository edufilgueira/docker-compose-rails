# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GestoresEixosController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/gestores_eixos').to route_to('gestores_eixos#index')
    end

    it 'routes to #new' do
      expect(get: '/gestores_eixos/new').to route_to('gestores_eixos#new')
    end

    it 'routes to #show' do
      expect(get: '/gestores_eixos/1').to route_to('gestores_eixos#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/gestores_eixos/1/edit').to route_to('gestores_eixos#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/gestores_eixos').to route_to('gestores_eixos#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/gestores_eixos/1').to route_to('gestores_eixos#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/gestores_eixos/1').to route_to('gestores_eixos#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/gestores_eixos/1').to route_to('gestores_eixos#destroy', id: '1')
    end
  end
end
