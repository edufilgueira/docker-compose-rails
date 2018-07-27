# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'depositos/edit', type: :view do
  before(:each) do
    @deposito = assign(:deposito, Deposito.create!(
                                    nome: 'MyString'
    ))
  end

  it 'renders the edit deposito form' do
    render

    assert_select 'form[action=?][method=?]', deposito_path(@deposito), 'post' do
      assert_select 'input[name=?]', 'deposito[nome]'
    end
  end
end
