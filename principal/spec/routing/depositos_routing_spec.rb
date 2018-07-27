# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DepositosController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/depositos').to route_to('depositos#index')
    end

    it 'routes to #new' do
      expect(get: '/depositos/new').to route_to('depositos#new')
    end

    it 'routes to #show' do
      expect(get: '/depositos/1').to route_to('depositos#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/depositos/1/edit').to route_to('depositos#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/depositos').to route_to('depositos#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/depositos/1').to route_to('depositos#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/depositos/1').to route_to('depositos#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/depositos/1').to route_to('depositos#destroy', id: '1')
    end
  end
end
