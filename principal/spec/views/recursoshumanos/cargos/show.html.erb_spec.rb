# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recursoshumanos/cargos/show', type: :view do
  before(:each) do
    @recursoshumanos_cargo = assign(:recursoshumanos_cargo, FactoryBot.create(:recursoshumanos_cargo))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
