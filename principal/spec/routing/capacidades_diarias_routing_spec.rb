# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CapacidadesDiariasController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/capacidades_diarias').to route_to('capacidades_diarias#index')
    end

    it 'routes to #new' do
      expect(get: '/capacidades_diarias/new').to route_to('capacidades_diarias#new')
    end

    it 'routes to #show' do
      expect(get: '/capacidades_diarias/1').to route_to('capacidades_diarias#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/capacidades_diarias/1/edit').to route_to('capacidades_diarias#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/capacidades_diarias').to route_to('capacidades_diarias#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/capacidades_diarias/1').to route_to('capacidades_diarias#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/capacidades_diarias/1').to route_to('capacidades_diarias#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/capacidades_diarias/1').to route_to('capacidades_diarias#destroy', id: '1')
    end
  end
end
