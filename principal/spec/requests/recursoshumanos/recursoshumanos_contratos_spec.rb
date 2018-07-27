# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recursoshumanos::Contratos', type: :request do
  sign_in_user
  describe 'GET /recursoshumanos_contratos' do
    it 'works! (now write some real specs)' do
      get recursoshumanos_contratos_path
      expect(response).to have_http_status(200)
    end
  end
end
