# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Depositos', type: :request do
  sign_in_user
  describe 'GET /depositos' do
    it 'works! (now write some real specs)' do
      get depositos_path
      expect(response).to have_http_status(200)
    end
  end
end
