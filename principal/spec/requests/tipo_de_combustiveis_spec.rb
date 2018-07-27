# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'TipoDeCombustiveis', type: :request do
  sign_in_user
  describe 'GET /tipo_de_combustiveis' do
    it 'works! (now write some real specs)' do
      get tipo_de_combustiveis_path
      expect(response).to have_http_status(200)
    end
  end
end
