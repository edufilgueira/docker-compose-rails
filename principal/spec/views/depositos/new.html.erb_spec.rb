# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'depositos/new', type: :view do
  before(:each) do
    assign(:deposito, Deposito.new(
                        nome: 'MyString'
    ))
  end

  it 'renders new deposito form' do
    render

    assert_select 'form[action=?][method=?]', depositos_path, 'post' do
      assert_select 'input[name=?]', 'deposito[nome]'
    end
  end
end
