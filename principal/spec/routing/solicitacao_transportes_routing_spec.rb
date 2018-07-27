# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SolicitacaoTransportesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/solicitacao_transportes').to route_to('solicitacao_transportes#index')
    end

    it 'routes to #new' do
      expect(get: '/solicitacao_transportes/new').to route_to('solicitacao_transportes#new')
    end

    it 'routes to #show' do
      expect(get: '/solicitacao_transportes/1').to route_to('solicitacao_transportes#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/solicitacao_transportes/1/edit').to route_to('solicitacao_transportes#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/solicitacao_transportes').to route_to('solicitacao_transportes#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/solicitacao_transportes/1').to route_to('solicitacao_transportes#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/solicitacao_transportes/1').to route_to('solicitacao_transportes#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/solicitacao_transportes/1').to route_to('solicitacao_transportes#destroy', id: '1')
    end
  end
end
