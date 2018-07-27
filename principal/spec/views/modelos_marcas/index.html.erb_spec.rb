# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'modelos_marcas/index', type: :view do
  before(:each) do
    @modelos_marcas = assign(:modelos_marca, [FactoryBot.create(:modelos_marca), FactoryBot.create(:modelos_marca)])
  end

  it 'renders a list of modelos_marcas' do
    render
    assert_select 'tr>td', text: 'Modelo'.to_s, count: 2
  end
end
