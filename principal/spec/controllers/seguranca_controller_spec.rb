# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SegurancaController, type: :controller do
  describe 'GET #index' do
    stub_sign_in
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
