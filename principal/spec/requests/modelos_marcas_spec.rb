# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ModelosMarcas', type: :request do
  sign_in_user
  describe 'GET /modelos_marcas' do
    it 'works! (now write some real specs)' do
      get modelos_marcas_path
      expect(response).to have_http_status(200)
    end
  end
end
