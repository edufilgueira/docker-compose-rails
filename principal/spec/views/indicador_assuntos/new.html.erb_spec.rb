# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'indicador_assuntos/new', type: :view do
  before(:each) do
    assign(:indicador_assunto, IndicadorAssunto.new(
                                 nome: 'MyString'
    ))
  end

  it 'renders new indicador_assunto form' do
    render

    assert_select 'form[action=?][method=?]', indicador_assuntos_path, 'post' do
      assert_select 'input[name=?]', 'indicador_assunto[nome]'
    end
  end
end
