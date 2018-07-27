# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'funcoes/index', type: :view do
  before(:each) do
    @funcao = FactoryBot.create(:funcao)
    assign(:funcoes, [@funcao, @funcao])
  end

  it 'renders a list of funcoes' do
    render
    assert_select 'tr>td', text: @funcao.nome, count: 2

    assert_select 'tr>td', text: @funcao.area.to_s, count: 2
  end
end
