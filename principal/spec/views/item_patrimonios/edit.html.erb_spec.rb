# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'item_patrimonios/edit', type: :view do
  before(:each) do
    @item_patrimonio = assign(:item_patrimonio, FactoryBot.create(:item_patrimonio))
  end

  it 'renders the edit item_patrimonio form' do
    render

    assert_select 'form[action=?][method=?]', item_patrimonio_path(@item_patrimonio), 'post' do
      assert_select 'input[name=?]', 'item_patrimonio[nome]'

      assert_select 'textarea[name=?]', 'item_patrimonio[descricao]'

      assert_select 'input[name=?]', 'item_patrimonio[codigo]'
    end
  end
end
