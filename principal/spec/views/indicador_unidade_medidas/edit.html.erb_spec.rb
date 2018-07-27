# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'indicador_unidade_medidas/edit', type: :view do
  before(:each) do
    @indicador_unidade_medida = assign(:indicador_unidade_medida, IndicadorUnidadeMedida.create!(
                                                                    nome: 'MyString',
                                                                    sigla: 'MyString'
    ))
  end

  it 'renders the edit indicador_unidade_medida form' do
    render

    assert_select 'form[action=?][method=?]', indicador_unidade_medida_path(@indicador_unidade_medida), 'post' do
      assert_select 'input[name=?]', 'indicador_unidade_medida[nome]'

      assert_select 'input[name=?]', 'indicador_unidade_medida[sigla]'
    end
  end
end
