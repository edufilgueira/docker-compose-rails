# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'StatusPatrimonios', type: :request do
  sign_in_user
  describe 'GET /status_patrimonios' do
    it 'works! (now write some real specs)' do
      get status_patrimonios_path
      expect(response).to have_http_status(200)
    end
  end
end
