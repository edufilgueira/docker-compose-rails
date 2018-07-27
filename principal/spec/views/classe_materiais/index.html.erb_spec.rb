# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'classe_materiais/index', type: :view do
  before(:each) do
    @classe_material = FactoryBot.create(:classe_material)
    assign(:classe_materiais, [@classe_material, @classe_material])
  end

  it 'renders a list of classe_materiais' do
    render
    assert_select 'tr>td', text: @classe_material.grupo_material.to_s, count: 2
    assert_select 'tr>td', text: 'Nome'.to_s, count: 2
  end
end
