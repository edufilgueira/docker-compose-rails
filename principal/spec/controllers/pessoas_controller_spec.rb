# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PessoasController, type: :controller do
  let(:valid_attributes) do
    { nome: 'Meu nome',  cpf: '51269572369', sexo: 'M', data_contratacao: '19/12/2000'}
  end

  let(:invalid_attributes) do
    { nome: 'Meu nome',  cpf: '12345678900', sexo: 'M', data_contratacao: '19/12/2000' }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PessoasController. Be sure to keep this updated too.
  stub_sign_in
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      pessoa = Pessoa.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #contratacao' do
    it 'returns a success response' do
      pessoa = Pessoa.create! valid_attributes
      get :contratacao, params: {}, session: valid_session
      expect(response).to be_success
    end
  end
end
