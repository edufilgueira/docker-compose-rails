# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posto_combustiveis/show', type: :view do
  before(:each) do
    @posto_combustivel = assign(:posto_combustivel, PostoCombustivel.create!(
                                                      nome: 'Nome',
                                                      cnpj: 'Cnpj',
                                                      rua: 'Rua',
                                                      numero: 'Numero',
                                                      bairro: 'Bairro'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Cnpj/)
    expect(rendered).to match(/Rua/)
    expect(rendered).to match(/Numero/)
    expect(rendered).to match(/Bairro/)
  end
end
