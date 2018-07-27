# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClassePatrimoniosController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/classe_patrimonios').to route_to('classe_patrimonios#index')
    end

    it 'routes to #new' do
      expect(get: '/classe_patrimonios/new').to route_to('classe_patrimonios#new')
    end

    it 'routes to #show' do
      expect(get: '/classe_patrimonios/1').to route_to('classe_patrimonios#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/classe_patrimonios/1/edit').to route_to('classe_patrimonios#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/classe_patrimonios').to route_to('classe_patrimonios#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/classe_patrimonios/1').to route_to('classe_patrimonios#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/classe_patrimonios/1').to route_to('classe_patrimonios#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/classe_patrimonios/1').to route_to('classe_patrimonios#destroy', id: '1')
    end
  end
end
