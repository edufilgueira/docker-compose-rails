# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'FuncaoPessoas', type: :request do
  sign_in_user
  describe 'GET /funcao_pessoas' do
    it 'works! (now write some real specs)' do
      get funcao_pessoas_path
      expect(response).to have_http_status(200)
    end
  end
end
