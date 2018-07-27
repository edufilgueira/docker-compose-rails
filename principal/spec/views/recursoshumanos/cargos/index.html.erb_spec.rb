# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recursoshumanos/cargos/index', type: :view do
  before(:each) do
    assign(:recursoshumanos_cargos, [
             FactoryBot.create(:recursoshumanos_cargo),
             FactoryBot.create(:recursoshumanos_cargo)
           ])
  end

  it 'renders a list of recursoshumanos/cargos' do
    render
    assert_select 'tr>td', text: 'MyString'
    assert_select 'tr>td', text: 'MyString'
  end
end
