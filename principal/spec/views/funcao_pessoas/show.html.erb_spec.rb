# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'funcao_pessoas/show', type: :view do
  before(:each) do
    @funcao_pessoas = assign(:funcao_pessoa, FactoryBot.create(:funcao_pessoa))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(@funcao_pessoas.funcao.nome)
    expect(rendered).to match(@funcao_pessoas.pessoa.nome.upcase)
  end
end
