# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posto_combustiveis/edit', type: :view do
  before(:each) do
    @posto_combustivel = assign(:posto_combustivel, PostoCombustivel.create!(
                                                      nome: 'MyString',
                                                      cnpj: 'MyString',
                                                      rua: 'MyString',
                                                      numero: 'MyString',
                                                      bairro: 'MyString'
    ))
  end

  it 'renders the edit posto_combustivel form' do
    render

    assert_select 'form[action=?][method=?]', posto_combustivel_path(@posto_combustivel), 'post' do
      assert_select 'input[name=?]', 'posto_combustivel[nome]'

      assert_select 'input[name=?]', 'posto_combustivel[cnpj]'

      assert_select 'input[name=?]', 'posto_combustivel[rua]'

      assert_select 'input[name=?]', 'posto_combustivel[numero]'

      assert_select 'input[name=?]', 'posto_combustivel[bairro]'
    end
  end
end
