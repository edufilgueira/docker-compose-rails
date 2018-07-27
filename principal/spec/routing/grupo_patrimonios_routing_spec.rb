# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GrupoPatrimoniosController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/grupo_patrimonios').to route_to('grupo_patrimonios#index')
    end

    it 'routes to #new' do
      expect(get: '/grupo_patrimonios/new').to route_to('grupo_patrimonios#new')
    end

    it 'routes to #show' do
      expect(get: '/grupo_patrimonios/1').to route_to('grupo_patrimonios#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/grupo_patrimonios/1/edit').to route_to('grupo_patrimonios#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/grupo_patrimonios').to route_to('grupo_patrimonios#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/grupo_patrimonios/1').to route_to('grupo_patrimonios#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/grupo_patrimonios/1').to route_to('grupo_patrimonios#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/grupo_patrimonios/1').to route_to('grupo_patrimonios#destroy', id: '1')
    end
  end
end
