# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'classe_patrimonios/new', type: :view do
  before(:each) do
    assign(:classe_patrimonio, FactoryBot.build(:classe_patrimonio))
  end

  it 'renders new classe_patrimonio form' do
    render

    assert_select 'form[action=?][method=?]', classe_patrimonios_path, 'post' do
      assert_select 'select[name=?]', 'classe_patrimonio[grupo_patrimonio_id]'

      assert_select 'input[name=?]', 'classe_patrimonio[codigo]'

      assert_select 'input[name=?]', 'classe_patrimonio[nome]'
    end
  end
end
