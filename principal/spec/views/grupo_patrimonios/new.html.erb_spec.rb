# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'grupo_patrimonios/new', type: :view do
  before(:each) do
    assign(:grupo_patrimonio, GrupoPatrimonio.new(
                                codigo: 'MyString',
                                nome: 'MyString'
    ))
  end

  it 'renders new grupo_patrimonio form' do
    render

    assert_select 'form[action=?][method=?]', grupo_patrimonios_path, 'post' do
      assert_select 'input[name=?]', 'grupo_patrimonio[codigo]'

      assert_select 'input[name=?]', 'grupo_patrimonio[nome]'
    end
  end
end
