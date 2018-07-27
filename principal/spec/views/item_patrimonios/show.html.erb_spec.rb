# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'item_patrimonios/show', type: :view do
  before(:each) do
    @item_patrimonio = assign(:item_patrimonio, FactoryBot.create(:item_patrimonio))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(@item_patrimonio.classe_patrimonio.nome)
    expect(rendered).to match(@item_patrimonio.tipo_patrimonio.nome)
    expect(rendered).to match(@item_patrimonio.nome)
    expect(rendered).to match(@item_patrimonio.codigo)
    expect(rendered).to match(@item_patrimonio.descricao)
  end
end
