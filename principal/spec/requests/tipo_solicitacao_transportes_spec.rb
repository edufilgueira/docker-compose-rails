# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'TipoSolicitacaoTransportes', type: :request do
  sign_in_user
  describe 'GET /tipo_solicitacao_transportes' do
    it 'works! (now write some real specs)' do
      get tipo_solicitacao_transportes_path
      expect(response).to have_http_status(200)
    end
  end
end
