# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EixosController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/eixos').to route_to('eixos#index')
    end

    it 'routes to #new' do
      expect(get: '/eixos/new').to route_to('eixos#new')
    end

    it 'routes to #show' do
      expect(get: '/eixos/1').to route_to('eixos#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/eixos/1/edit').to route_to('eixos#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/eixos').to route_to('eixos#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/eixos/1').to route_to('eixos#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/eixos/1').to route_to('eixos#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/eixos/1').to route_to('eixos#destroy', id: '1')
    end
  end
end
