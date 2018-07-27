# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemPatrimoniosController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/item_patrimonios').to route_to('item_patrimonios#index')
    end

    it 'routes to #new' do
      expect(get: '/item_patrimonios/new').to route_to('item_patrimonios#new')
    end

    it 'routes to #show' do
      expect(get: '/item_patrimonios/1').to route_to('item_patrimonios#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/item_patrimonios/1/edit').to route_to('item_patrimonios#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/item_patrimonios').to route_to('item_patrimonios#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/item_patrimonios/1').to route_to('item_patrimonios#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/item_patrimonios/1').to route_to('item_patrimonios#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/item_patrimonios/1').to route_to('item_patrimonios#destroy', id: '1')
    end
  end
end
