# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PatrimoniosController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/patrimonios').to route_to('patrimonios#index')
    end

    it 'routes to #new' do
      expect(get: '/patrimonios/new').to route_to('patrimonios#new')
    end

    it 'routes to #show' do
      expect(get: '/patrimonios/1').to route_to('patrimonios#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/patrimonios/1/edit').to route_to('patrimonios#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/patrimonios').to route_to('patrimonios#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/patrimonios/1').to route_to('patrimonios#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/patrimonios/1').to route_to('patrimonios#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/patrimonios/1').to route_to('patrimonios#destroy', id: '1')
    end
  end
end
