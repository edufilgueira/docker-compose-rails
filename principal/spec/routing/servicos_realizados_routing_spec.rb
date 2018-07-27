# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ServicosRealizadosController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/servicos_realizados').to route_to('servicos_realizados#index')
    end

    it 'routes to #new' do
      expect(get: '/servicos_realizados/new').to route_to('servicos_realizados#new')
    end

    it 'routes to #show' do
      expect(get: '/servicos_realizados/1').to route_to('servicos_realizados#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/servicos_realizados/1/edit').to route_to('servicos_realizados#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/servicos_realizados').to route_to('servicos_realizados#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/servicos_realizados/1').to route_to('servicos_realizados#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/servicos_realizados/1').to route_to('servicos_realizados#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/servicos_realizados/1').to route_to('servicos_realizados#destroy', id: '1')
    end
  end
end
