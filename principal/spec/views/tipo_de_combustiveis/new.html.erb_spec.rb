# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tipo_de_combustiveis/new', type: :view do
  before(:each) do
    assign(:tipo_de_combustivel, TipoDeCombustivel.new(
                                   nome: 'MyString'
    ))
  end

  it 'renders new tipo_de_combustivel form' do
    render

    assert_select 'form[action=?][method=?]', tipo_de_combustiveis_path, 'post' do
      assert_select 'input[name=?]', 'tipo_de_combustivel[nome]'
    end
  end
end
