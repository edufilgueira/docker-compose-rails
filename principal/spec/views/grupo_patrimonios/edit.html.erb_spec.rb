# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'grupo_patrimonios/edit', type: :view do
  before(:each) do
    @grupo_patrimonio = assign(:grupo_patrimonio, GrupoPatrimonio.create!(
                                                    codigo: 'MyString',
                                                    nome: 'MyString'
    ))
  end

  it 'renders the edit grupo_patrimonio form' do
    render

    assert_select 'form[action=?][method=?]', grupo_patrimonio_path(@grupo_patrimonio), 'post' do
      assert_select 'input[name=?]', 'grupo_patrimonio[codigo]'

      assert_select 'input[name=?]', 'grupo_patrimonio[nome]'
    end
  end
end
