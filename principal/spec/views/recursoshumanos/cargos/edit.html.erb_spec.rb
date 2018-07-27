# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recursoshumanos/cargos/edit', type: :view do
  before(:each) do
    @recursoshumanos_cargo = assign(:recursoshumanos_cargo, FactoryBot.create(:recursoshumanos_cargo))
  end

  it 'renders the edit recursoshumanos_cargo form' do
    render

    assert_select 'form[action=?][method=?]', recursoshumanos_cargo_path(@recursoshumanos_cargo), 'post' do
      assert_select 'input[name=?]', 'recursoshumanos_cargo[nome]'

      assert_select 'input[name=?]', 'recursoshumanos_cargo[quantidade]'

      assert_select 'select[name=?]', 'recursoshumanos_cargo[contrato_id]'
    end
  end
end
