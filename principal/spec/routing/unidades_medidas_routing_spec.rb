# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UnidadesMedidasController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/unidades_medidas').to route_to('unidades_medidas#index')
    end

    it 'routes to #new' do
      expect(get: '/unidades_medidas/new').to route_to('unidades_medidas#new')
    end

    it 'routes to #show' do
      expect(get: '/unidades_medidas/1').to route_to('unidades_medidas#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/unidades_medidas/1/edit').to route_to('unidades_medidas#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/unidades_medidas').to route_to('unidades_medidas#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/unidades_medidas/1').to route_to('unidades_medidas#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/unidades_medidas/1').to route_to('unidades_medidas#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/unidades_medidas/1').to route_to('unidades_medidas#destroy', id: '1')
    end
  end
end
