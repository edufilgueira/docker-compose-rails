# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UnidadesSocioeducativasController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/unidades_socioeducativas').to route_to('unidades_socioeducativas#index')
    end

    it 'routes to #new' do
      expect(get: '/unidades_socioeducativas/new').to route_to('unidades_socioeducativas#new')
    end

    it 'routes to #show' do
      expect(get: '/unidades_socioeducativas/1').to route_to('unidades_socioeducativas#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/unidades_socioeducativas/1/edit').to route_to('unidades_socioeducativas#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/unidades_socioeducativas').to route_to('unidades_socioeducativas#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/unidades_socioeducativas/1').to route_to('unidades_socioeducativas#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/unidades_socioeducativas/1').to route_to('unidades_socioeducativas#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/unidades_socioeducativas/1').to route_to('unidades_socioeducativas#destroy', id: '1')
    end
  end
end
