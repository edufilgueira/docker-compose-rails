# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'indicador_unidade_medidas/new', type: :view do
  before(:each) do
    assign(:indicador_unidade_medida, IndicadorUnidadeMedida.new(
                                        nome: 'MyString',
                                        sigla: 'MyString'
    ))
  end

  it 'renders new indicador_unidade_medida form' do
    render

    assert_select 'form[action=?][method=?]', indicador_unidade_medidas_path, 'post' do
      assert_select 'input[name=?]', 'indicador_unidade_medida[nome]'

      assert_select 'input[name=?]', 'indicador_unidade_medida[sigla]'
    end
  end
end
