# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MateriaisController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/materiais').to route_to('materiais#index')
    end

    it 'routes to #new' do
      expect(get: '/materiais/new').to route_to('materiais#new')
    end

    it 'routes to #show' do
      expect(get: '/materiais/1').to route_to('materiais#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/materiais/1/edit').to route_to('materiais#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/materiais').to route_to('materiais#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/materiais/1').to route_to('materiais#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/materiais/1').to route_to('materiais#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/materiais/1').to route_to('materiais#destroy', id: '1')
    end
  end
end
