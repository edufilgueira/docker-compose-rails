# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'categoria_patrimonios/new', type: :view do
  before(:each) do
    assign(:categoria_patrimonio, CategoriaPatrimonio.new(
                                    nome: 'MyString'
    ))
  end

  it 'renders new categoria_patrimonio form' do
    render

    assert_select 'form[action=?][method=?]', categoria_patrimonios_path, 'post' do
      assert_select 'input[name=?]', 'categoria_patrimonio[nome]'
    end
  end
end
