# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClasseMateriaisController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/classe_materiais').to route_to('classe_materiais#index')
    end

    it 'routes to #new' do
      expect(get: '/classe_materiais/new').to route_to('classe_materiais#new')
    end

    it 'routes to #show' do
      expect(get: '/classe_materiais/1').to route_to('classe_materiais#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/classe_materiais/1/edit').to route_to('classe_materiais#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/classe_materiais').to route_to('classe_materiais#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/classe_materiais/1').to route_to('classe_materiais#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/classe_materiais/1').to route_to('classe_materiais#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/classe_materiais/1').to route_to('classe_materiais#destroy', id: '1')
    end
  end
end
