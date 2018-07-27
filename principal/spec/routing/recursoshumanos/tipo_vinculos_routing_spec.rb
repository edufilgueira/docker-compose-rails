# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recursoshumanos::TipoVinculosController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/recursoshumanos/tipo_vinculos').to route_to('recursoshumanos/tipo_vinculos#index')
    end

    it 'routes to #new' do
      expect(get: '/recursoshumanos/tipo_vinculos/new').to route_to('recursoshumanos/tipo_vinculos#new')
    end

    it 'routes to #show' do
      expect(get: '/recursoshumanos/tipo_vinculos/1').to route_to('recursoshumanos/tipo_vinculos#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/recursoshumanos/tipo_vinculos/1/edit').to route_to('recursoshumanos/tipo_vinculos#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/recursoshumanos/tipo_vinculos').to route_to('recursoshumanos/tipo_vinculos#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/recursoshumanos/tipo_vinculos/1').to route_to('recursoshumanos/tipo_vinculos#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/recursoshumanos/tipo_vinculos/1').to route_to('recursoshumanos/tipo_vinculos#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/recursoshumanos/tipo_vinculos/1').to route_to('recursoshumanos/tipo_vinculos#destroy', id: '1')
    end
  end
end
