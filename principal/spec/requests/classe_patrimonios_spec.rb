# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ClassePatrimonios', type: :request do
  sign_in_user
  describe 'GET /classe_patrimonios' do
    it 'works! (now write some real specs)' do
      get classe_patrimonios_path
      expect(response).to have_http_status(200)
    end
  end
end
