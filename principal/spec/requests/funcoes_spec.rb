# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Funcoes', type: :request do
  sign_in_user
  describe 'GET /funcoes' do
    it 'works! (now write some real specs)' do
      get funcoes_path
      expect(response).to have_http_status(200)
    end
  end
end
