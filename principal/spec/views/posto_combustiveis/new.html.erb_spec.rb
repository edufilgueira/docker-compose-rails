# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posto_combustiveis/new', type: :view do
  before(:each) do
    assign(:posto_combustivel, PostoCombustivel.new(
                                 nome: 'MyString',
                                 cnpj: 'MyString',
                                 rua: 'MyString',
                                 numero: 'MyString',
                                 bairro: 'MyString'
    ))
  end

  it 'renders new posto_combustivel form' do
    render

    assert_select 'form[action=?][method=?]', posto_combustiveis_path, 'post' do
      assert_select 'input[name=?]', 'posto_combustivel[nome]'

      assert_select 'input[name=?]', 'posto_combustivel[cnpj]'

      assert_select 'input[name=?]', 'posto_combustivel[rua]'

      assert_select 'input[name=?]', 'posto_combustivel[numero]'

      assert_select 'input[name=?]', 'posto_combustivel[bairro]'
    end
  end
end
