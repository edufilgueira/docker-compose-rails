# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'indicador_assuntos/edit', type: :view do
  before(:each) do
    @indicador_assunto = assign(:indicador_assunto, IndicadorAssunto.create!(
                                                      nome: 'MyString'
    ))
  end

  it 'renders the edit indicador_assunto form' do
    render

    assert_select 'form[action=?][method=?]', indicador_assunto_path(@indicador_assunto), 'post' do
      assert_select 'input[name=?]', 'indicador_assunto[nome]'
    end
  end
end
