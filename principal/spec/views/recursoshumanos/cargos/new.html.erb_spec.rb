# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recursoshumanos/cargos/new', type: :view do
  before(:each) do
    assign(:recursoshumanos_cargo, FactoryBot.build(:recursoshumanos_cargo))
  end

  it 'renders new recursoshumanos_cargo form' do
    render

    assert_select 'form[action=?][method=?]', recursoshumanos_cargos_path, 'post' do
      assert_select 'input[name=?]', 'recursoshumanos_cargo[nome]'

      assert_select 'input[name=?]', 'recursoshumanos_cargo[quantidade]'

      assert_select 'select[name=?]', 'recursoshumanos_cargo[contrato_id]'
    end
  end
end
