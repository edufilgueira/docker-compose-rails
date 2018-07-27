# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SocioeducandosAtendidosController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/socioeducandos_atendidos').to route_to('socioeducandos_atendidos#index')
    end

    it 'routes to #new' do
      expect(get: '/socioeducandos_atendidos/new').to route_to('socioeducandos_atendidos#new')
    end

    it 'routes to #show' do
      expect(get: '/socioeducandos_atendidos/1').to route_to('socioeducandos_atendidos#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/socioeducandos_atendidos/1/edit').to route_to('socioeducandos_atendidos#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/socioeducandos_atendidos').to route_to('socioeducandos_atendidos#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/socioeducandos_atendidos/1').to route_to('socioeducandos_atendidos#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/socioeducandos_atendidos/1').to route_to('socioeducandos_atendidos#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/socioeducandos_atendidos/1').to route_to('socioeducandos_atendidos#destroy', id: '1')
    end
  end
end
