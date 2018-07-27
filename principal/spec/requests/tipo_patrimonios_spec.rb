# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'TipoPatrimonios', type: :request do
  sign_in_user
  describe 'GET /tipo_patrimonios' do
    it 'works! (now write some real specs)' do
      get tipo_patrimonios_path
      expect(response).to have_http_status(200)
    end
  end
end
