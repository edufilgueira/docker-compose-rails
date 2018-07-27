# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'item_patrimonios/index', type: :view do
  before(:each) do
    @item_patrimonio = FactoryBot.create(:item_patrimonio)
    assign(:item_patrimonios, [@item_patrimonio, @item_patrimonio])
  end

  it 'renders a list of item_patrimonios' do
    render
    assert_select 'tr>td', text: @item_patrimonio.classe_patrimonio.to_s.upcase, count: 2
    assert_select 'tr>td', text: @item_patrimonio.tipo_patrimonio.to_s.upcase, count: 2
    assert_select 'tr>td', text: @item_patrimonio.nome.to_s.upcase, count: 2
    assert_select 'tr>td', text: @item_patrimonio.descricao.to_s.upcase, count: 2
    assert_select 'tr>td', text: @item_patrimonio.codigo.to_s, count: 2
  end
end
