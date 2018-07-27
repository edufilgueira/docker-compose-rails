# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FuncaoPessoasController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/funcao_pessoas').to route_to('funcao_pessoas#index')
    end

    it 'routes to #new' do
      expect(get: '/funcao_pessoas/new').to route_to('funcao_pessoas#new')
    end

    it 'routes to #show' do
      expect(get: '/funcao_pessoas/1').to route_to('funcao_pessoas#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/funcao_pessoas/1/edit').to route_to('funcao_pessoas#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/funcao_pessoas').to route_to('funcao_pessoas#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/funcao_pessoas/1').to route_to('funcao_pessoas#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/funcao_pessoas/1').to route_to('funcao_pessoas#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/funcao_pessoas/1').to route_to('funcao_pessoas#destroy', id: '1')
    end
  end
end
