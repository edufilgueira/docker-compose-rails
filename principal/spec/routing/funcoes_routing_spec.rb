# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FuncoesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/funcoes').to route_to('funcoes#index')
    end

    it 'routes to #new' do
      expect(get: '/funcoes/new').to route_to('funcoes#new')
    end

    it 'routes to #show' do
      expect(get: '/funcoes/1').to route_to('funcoes#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/funcoes/1/edit').to route_to('funcoes#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/funcoes').to route_to('funcoes#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/funcoes/1').to route_to('funcoes#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/funcoes/1').to route_to('funcoes#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/funcoes/1').to route_to('funcoes#destroy', id: '1')
    end
  end
end
