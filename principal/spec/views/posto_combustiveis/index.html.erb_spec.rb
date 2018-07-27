# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posto_combustiveis/index', type: :view do
  before(:each) do
    assign(:posto_combustiveis, [
             PostoCombustivel.create!(
               nome: 'Nome',
               cnpj: 'Cnpj',
               rua: 'Rua',
               numero: 'Numero',
               bairro: 'Bairro'
             ),
             PostoCombustivel.create!(
               nome: 'Nome',
               cnpj: 'Cnpj',
               rua: 'Rua',
               numero: 'Numero',
               bairro: 'Bairro'
             )
           ])
  end

  it 'renders a list of posto_combustiveis' do
    render
    assert_select 'tr>td', text: 'Nome'.to_s, count: 2
    assert_select 'tr>td', text: 'Cnpj'.to_s, count: 2
    assert_select 'tr>td', text: 'Rua'.to_s, count: 2
    assert_select 'tr>td', text: 'Numero'.to_s, count: 2
    assert_select 'tr>td', text: 'Bairro'.to_s, count: 2
  end
end
