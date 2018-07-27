# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostoCombustiveisController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/posto_combustiveis').to route_to('posto_combustiveis#index')
    end

    it 'routes to #new' do
      expect(get: '/posto_combustiveis/new').to route_to('posto_combustiveis#new')
    end

    it 'routes to #show' do
      expect(get: '/posto_combustiveis/1').to route_to('posto_combustiveis#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/posto_combustiveis/1/edit').to route_to('posto_combustiveis#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/posto_combustiveis').to route_to('posto_combustiveis#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/posto_combustiveis/1').to route_to('posto_combustiveis#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/posto_combustiveis/1').to route_to('posto_combustiveis#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/posto_combustiveis/1').to route_to('posto_combustiveis#destroy', id: '1')
    end
  end
end
