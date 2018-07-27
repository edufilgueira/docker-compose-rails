# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'IndicadorAssuntos', type: :request do
  sign_in_user
  describe 'GET /indicador_assuntos' do
    it 'works! (now write some real specs)' do
      get indicador_assuntos_path
      expect(response).to have_http_status(200)
    end
  end
end
