# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recursoshumanos::VinculosController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/recursoshumanos/vinculos').to route_to('recursoshumanos/vinculos#index')
    end

    it 'routes to #new' do
      expect(get: '/recursoshumanos/vinculos/new').to route_to('recursoshumanos/vinculos#new')
    end

    it 'routes to #show' do
      expect(get: '/recursoshumanos/vinculos/1').to route_to('recursoshumanos/vinculos#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/recursoshumanos/vinculos/1/edit').to route_to('recursoshumanos/vinculos#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/recursoshumanos/vinculos').to route_to('recursoshumanos/vinculos#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/recursoshumanos/vinculos/1').to route_to('recursoshumanos/vinculos#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/recursoshumanos/vinculos/1').to route_to('recursoshumanos/vinculos#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/recursoshumanos/vinculos/1').to route_to('recursoshumanos/vinculos#destroy', id: '1')
    end
  end
end
