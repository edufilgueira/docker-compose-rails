# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'item_patrimonios/new', type: :view do
  before(:each) do
    assign(:item_patrimonio, FactoryBot.build(:item_patrimonio))
  end

  it 'renders new item_patrimonio form' do
    render

    assert_select 'form[action=?][method=?]', item_patrimonios_path, 'post' do
      assert_select 'select[name=?]', 'item_patrimonio[classe_patrimonio_id]'

      assert_select 'select[name=?]', 'item_patrimonio[tipo_patrimonio_id]'

      assert_select 'input[name=?]', 'item_patrimonio[codigo]'

      assert_select 'input[name=?]', 'item_patrimonio[nome]'

      assert_select 'textarea[name=?]', 'item_patrimonio[descricao]'
    end
  end
end
