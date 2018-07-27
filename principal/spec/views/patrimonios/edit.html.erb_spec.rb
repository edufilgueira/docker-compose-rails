# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'patrimonios/edit', type: :view do
  before(:each) do
    @patrimonio = assign(:patrimonio, FactoryBot.create(:patrimonio))
  end

  xit 'renders the edit patrimonio form' do
    render

    assert_select 'form[action=?][method=?]', patrimonio_path(@patrimonio), 'post' do
      assert_select 'select[name=?]', 'patrimonio[item_patrimonio_id]'

      assert_select 'select[name=?]', 'patrimonio[status_patrimonio_id]'

      assert_select 'select[name=?]', 'patrimonio[deposito_id]'

      assert_select 'input[name=?]', 'patrimonio[tombo_anterior]'

      assert_select 'input[name=?]', 'patrimonio[origem_anterior]'

      assert_select 'input[name=?]', 'patrimonio[tombo_atual]'

      assert_select 'input[name=?]', 'patrimonio[origem_atual]'
    end
  end
end
