# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tipo_de_combustiveis/edit', type: :view do
  before(:each) do
    @tipo_de_combustivel = assign(:tipo_de_combustivel, TipoDeCombustivel.create!(
                                                          nome: 'MyString'
    ))
  end

  it 'renders the edit tipo_de_combustivel form' do
    render

    assert_select 'form[action=?][method=?]', tipo_de_combustivel_path(@tipo_de_combustivel), 'post' do
      assert_select 'input[name=?]', 'tipo_de_combustivel[nome]'
    end
  end
end
