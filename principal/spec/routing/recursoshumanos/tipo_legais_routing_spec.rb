# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recursoshumanos::TipoLegaisController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/recursoshumanos/tipo_legais').to route_to('recursoshumanos/tipo_legais#index')
    end

    it 'routes to #new' do
      expect(get: '/recursoshumanos/tipo_legais/new').to route_to('recursoshumanos/tipo_legais#new')
    end

    it 'routes to #show' do
      expect(get: '/recursoshumanos/tipo_legais/1').to route_to('recursoshumanos/tipo_legais#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/recursoshumanos/tipo_legais/1/edit').to route_to('recursoshumanos/tipo_legais#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/recursoshumanos/tipo_legais').to route_to('recursoshumanos/tipo_legais#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/recursoshumanos/tipo_legais/1').to route_to('recursoshumanos/tipo_legais#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/recursoshumanos/tipo_legais/1').to route_to('recursoshumanos/tipo_legais#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/recursoshumanos/tipo_legais/1').to route_to('recursoshumanos/tipo_legais#destroy', id: '1')
    end
  end
end
