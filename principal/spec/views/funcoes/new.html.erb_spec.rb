# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'funcoes/new', type: :view do
  before(:each) do
    assign(:funcao, Funcao.new(
                      nome: 'MyString'
    ))
  end

  it 'renders new funcao form' do
    render

    assert_select 'form[action=?][method=?]', funcoes_path, 'post' do
      assert_select 'input[name=?]', 'funcao[nome]'
    end
  end
end
