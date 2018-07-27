# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tipo_de_combustiveis/index', type: :view do
  before(:each) do
    assign(:tipo_de_combustiveis, [
             TipoDeCombustivel.create!(
               nome: 'Nome'
             ),
             TipoDeCombustivel.create!(
               nome: 'Nome'
             )
           ])
  end

  it 'renders a list of tipo_de_combustiveis' do
    render
    assert_select 'tr>td', text: 'Nome'.to_s, count: 2
  end
end
