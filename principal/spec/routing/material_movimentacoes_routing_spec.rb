# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MaterialMovimentacoesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/material_movimentacoes').to route_to('material_movimentacoes#index')
    end

    it 'routes to #new' do
      expect(get: '/material_movimentacoes/new').to route_to('material_movimentacoes#new')
    end

    it 'routes to #show' do
      expect(get: '/material_movimentacoes/1').to route_to('material_movimentacoes#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/material_movimentacoes/1/edit').to route_to('material_movimentacoes#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/material_movimentacoes').to route_to('material_movimentacoes#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/material_movimentacoes/1').to route_to('material_movimentacoes#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/material_movimentacoes/1').to route_to('material_movimentacoes#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/material_movimentacoes/1').to route_to('material_movimentacoes#destroy', id: '1')
    end
  end
end
