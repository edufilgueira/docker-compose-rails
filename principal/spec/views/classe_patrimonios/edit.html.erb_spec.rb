# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'classe_patrimonios/edit', type: :view do
  before(:each) do
    @classe_patrimonio = assign(:classe_patrimonio, FactoryBot.create(:classe_patrimonio))
  end

  it 'renders the edit classe_patrimonio form' do
    render

    assert_select 'form[action=?][method=?]', classe_patrimonio_path(@classe_patrimonio), 'post' do
      assert_select 'select[name=?]', 'classe_patrimonio[grupo_patrimonio_id]'

      assert_select 'input[name=?]', 'classe_patrimonio[codigo]'

      assert_select 'input[name=?]', 'classe_patrimonio[nome]'
    end
  end
end
