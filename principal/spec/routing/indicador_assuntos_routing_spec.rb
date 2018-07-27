# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IndicadorAssuntosController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/indicador_assuntos').to route_to('indicador_assuntos#index')
    end

    it 'routes to #new' do
      expect(get: '/indicador_assuntos/new').to route_to('indicador_assuntos#new')
    end

    it 'routes to #show' do
      expect(get: '/indicador_assuntos/1').to route_to('indicador_assuntos#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/indicador_assuntos/1/edit').to route_to('indicador_assuntos#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/indicador_assuntos').to route_to('indicador_assuntos#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/indicador_assuntos/1').to route_to('indicador_assuntos#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/indicador_assuntos/1').to route_to('indicador_assuntos#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/indicador_assuntos/1').to route_to('indicador_assuntos#destroy', id: '1')
    end
  end
end
