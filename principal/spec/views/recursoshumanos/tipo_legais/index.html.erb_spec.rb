# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recursoshumanos/tipo_legais/index', type: :view do
  before(:each) do
    assign(:recursoshumanos_tipo_legais, [
             FactoryBot.create(:recursoshumanos_tipo_legal),
             @tipo_legal = FactoryBot.create(:recursoshumanos_tipo_legal)
           ])
  end

  it 'renders a list of recursoshumanos/tipo_legais' do
    render
    assert_select 'tr>td', text: @tipo_legal.nome, count: 2
  end
end
