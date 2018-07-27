# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'SolicitacaoTransportes', type: :request do
  sign_in_user
  describe 'GET /solicitacao_transportes' do
    it 'works! (now write some real specs)' do
      get solicitacao_transportes_path
      expect(response).to have_http_status(200)
    end
  end
end
