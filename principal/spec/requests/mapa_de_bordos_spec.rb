# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MapaDeBordos', type: :request do
  sign_in_user
  describe 'GET /mapa_de_bordos' do
    it 'works! (now write some real specs)' do
      get mapa_de_bordos_path
      expect(response).to have_http_status(200)
    end
  end
end
