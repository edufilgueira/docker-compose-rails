# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recursoshumanos/contratos/show', type: :view do
  before(:each) do
    @recursoshumanos_contrato = assign(:recursoshumanos_contrato, FactoryBot.create(:recursoshumanos_contrato))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Inicio/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Doe Ce/)
  end
end
