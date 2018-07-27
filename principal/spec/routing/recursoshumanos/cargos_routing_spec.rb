# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recursoshumanos::CargosController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/recursoshumanos/cargos').to route_to('recursoshumanos/cargos#index')
    end

    it 'routes to #new' do
      expect(get: '/recursoshumanos/cargos/new').to route_to('recursoshumanos/cargos#new')
    end

    it 'routes to #show' do
      expect(get: '/recursoshumanos/cargos/1').to route_to('recursoshumanos/cargos#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/recursoshumanos/cargos/1/edit').to route_to('recursoshumanos/cargos#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/recursoshumanos/cargos').to route_to('recursoshumanos/cargos#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/recursoshumanos/cargos/1').to route_to('recursoshumanos/cargos#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/recursoshumanos/cargos/1').to route_to('recursoshumanos/cargos#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/recursoshumanos/cargos/1').to route_to('recursoshumanos/cargos#destroy', id: '1')
    end
  end
end
