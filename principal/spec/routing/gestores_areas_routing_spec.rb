# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GestoresAreasController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/gestores_areas').to route_to('gestores_areas#index')
    end

    it 'routes to #new' do
      expect(get: '/gestores_areas/new').to route_to('gestores_areas#new')
    end

    it 'routes to #show' do
      expect(get: '/gestores_areas/1').to route_to('gestores_areas#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/gestores_areas/1/edit').to route_to('gestores_areas#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/gestores_areas').to route_to('gestores_areas#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/gestores_areas/1').to route_to('gestores_areas#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/gestores_areas/1').to route_to('gestores_areas#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/gestores_areas/1').to route_to('gestores_areas#destroy', id: '1')
    end
  end
end
