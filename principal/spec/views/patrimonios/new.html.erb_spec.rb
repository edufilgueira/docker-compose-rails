# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'patrimonios/new', type: :view do
  before(:each) do
    assign(:patrimonio, FactoryBot.build(:patrimonio))
  end

  it 'renders new patrimonio form' do
    render

    assert_select 'form[action=?][method=?]', patrimonios_path, 'post' do
      assert_select 'select[name=?]', 'patrimonio[item_patrimonio_id]'

      assert_select 'select[name=?]', 'patrimonio[deposito_id]'

      assert_select 'select[name=?]', 'patrimonio[status_patrimonio_id]'

      assert_select 'input[name=?]', 'patrimonio[tombo_anterior]'

      assert_select 'input[name=?]', 'patrimonio[origem_anterior]'

      assert_select 'input[name=?]', 'patrimonio[tombo_atual]'

      assert_select 'input[name=?]', 'patrimonio[origem_atual]'

      assert_select 'input[name=?]', 'patrimonio[nota_fiscal]'

      assert_select 'input[name=?]', 'patrimonio[valor]'

      assert_select 'input[name=?]', 'patrimonio[ciclo_vida_util]'
    end
  end
end
