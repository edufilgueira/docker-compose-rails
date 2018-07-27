# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GestoresUnidadesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/gestores_unidades').to route_to('gestores_unidades#index')
    end

    it 'routes to #new' do
      expect(get: '/gestores_unidades/new').to route_to('gestores_unidades#new')
    end

    it 'routes to #show' do
      expect(get: '/gestores_unidades/1').to route_to('gestores_unidades#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/gestores_unidades/1/edit').to route_to('gestores_unidades#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/gestores_unidades').to route_to('gestores_unidades#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/gestores_unidades/1').to route_to('gestores_unidades#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/gestores_unidades/1').to route_to('gestores_unidades#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/gestores_unidades/1').to route_to('gestores_unidades#destroy', id: '1')
    end
  end
end
