# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'indicador_unidade_medidas/index', type: :view do
  before(:each) do
    assign(:indicador_unidade_medidas, [
             IndicadorUnidadeMedida.create!(
               nome: 'Nome',
               sigla: 'Sigla'
             ),
             IndicadorUnidadeMedida.create!(
               nome: 'Nome',
               sigla: 'Sigla'
             )
           ])
  end

  it 'renders a list of indicador_unidade_medidas' do
    render
    assert_select 'tr>td', text: 'Nome'.to_s, count: 2
    assert_select 'tr>td', text: 'Sigla'.to_s, count: 2
  end
end
