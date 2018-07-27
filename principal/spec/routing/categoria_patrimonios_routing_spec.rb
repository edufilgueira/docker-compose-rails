# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriaPatrimoniosController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/categoria_patrimonios').to route_to('categoria_patrimonios#index')
    end

    it 'routes to #new' do
      expect(get: '/categoria_patrimonios/new').to route_to('categoria_patrimonios#new')
    end

    it 'routes to #show' do
      expect(get: '/categoria_patrimonios/1').to route_to('categoria_patrimonios#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/categoria_patrimonios/1/edit').to route_to('categoria_patrimonios#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/categoria_patrimonios').to route_to('categoria_patrimonios#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/categoria_patrimonios/1').to route_to('categoria_patrimonios#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/categoria_patrimonios/1').to route_to('categoria_patrimonios#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/categoria_patrimonios/1').to route_to('categoria_patrimonios#destroy', id: '1')
    end
  end
end
