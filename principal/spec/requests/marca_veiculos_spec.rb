# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MarcaVeiculos', type: :request do
  sign_in_user
  describe 'GET /marca_veiculos' do
    it 'works! (now write some real specs)' do
      get marca_veiculos_path
      expect(response).to have_http_status(200)
    end
  end
end
