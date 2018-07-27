# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LocalArmazenamentos', type: :request do
  describe 'GET /local_armazenamentos' do
    before(:each) do
      user = FactoryBot.create(:valid_user_admin)
      sign_in user
    end
    it 'works! (now write some real specs)' do
      get local_armazenamentos_path
      expect(response).to have_http_status(200)
    end
  end
end
