# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recursoshumanos/contratos/index', type: :view do
  before(:each) do
    assign(:recursoshumanos_contratos, [
             FactoryBot.create(:recursoshumanos_contrato),
             FactoryBot.create(:recursoshumanos_contrato)
           ])
  end

  it 'renders a list of recursoshumanos/contratos' do
    render
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
    assert_select 'tr>td', text: 'Doe Ce'.to_s, count: 2
  end
end
