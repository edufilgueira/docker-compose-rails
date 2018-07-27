# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'categoria_patrimonios/edit', type: :view do
  before(:each) do
    @categoria_patrimonio = assign(:categoria_patrimonio, CategoriaPatrimonio.create!(
                                                            nome: 'MyString'
    ))
  end

  it 'renders the edit categoria_patrimonio form' do
    render

    assert_select 'form[action=?][method=?]', categoria_patrimonio_path(@categoria_patrimonio), 'post' do
      assert_select 'input[name=?]', 'categoria_patrimonio[nome]'
    end
  end
end
