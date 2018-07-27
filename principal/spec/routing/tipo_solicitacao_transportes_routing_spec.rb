# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TipoSolicitacaoTransportesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/tipo_solicitacao_transportes').to route_to('tipo_solicitacao_transportes#index')
    end

    it 'routes to #new' do
      expect(get: '/tipo_solicitacao_transportes/new').to route_to('tipo_solicitacao_transportes#new')
    end

    it 'routes to #show' do
      expect(get: '/tipo_solicitacao_transportes/1').to route_to('tipo_solicitacao_transportes#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/tipo_solicitacao_transportes/1/edit').to route_to('tipo_solicitacao_transportes#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/tipo_solicitacao_transportes').to route_to('tipo_solicitacao_transportes#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/tipo_solicitacao_transportes/1').to route_to('tipo_solicitacao_transportes#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/tipo_solicitacao_transportes/1').to route_to('tipo_solicitacao_transportes#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/tipo_solicitacao_transportes/1').to route_to('tipo_solicitacao_transportes#destroy', id: '1')
    end
  end
end
