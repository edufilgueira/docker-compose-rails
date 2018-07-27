# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recursoshumanos::ContratosController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/recursoshumanos/contratos').to route_to('recursoshumanos/contratos#index')
    end

    it 'routes to #new' do
      expect(get: '/recursoshumanos/contratos/new').to route_to('recursoshumanos/contratos#new')
    end

    it 'routes to #show' do
      expect(get: '/recursoshumanos/contratos/1').to route_to('recursoshumanos/contratos#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/recursoshumanos/contratos/1/edit').to route_to('recursoshumanos/contratos#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/recursoshumanos/contratos').to route_to('recursoshumanos/contratos#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/recursoshumanos/contratos/1').to route_to('recursoshumanos/contratos#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/recursoshumanos/contratos/1').to route_to('recursoshumanos/contratos#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/recursoshumanos/contratos/1').to route_to('recursoshumanos/contratos#destroy', id: '1')
    end
  end
end
