# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'classe_patrimonios/index', type: :view do
  before(:each) do
    @classe_patrimonio = FactoryBot.create(:classe_patrimonio)
    assign(:classe_patrimonios, [@classe_patrimonio, @classe_patrimonio])
  end

  it 'renders a list of classe_patrimonios' do
    render
    assert_select 'tr>td', text: @classe_patrimonio.grupo_patrimonio.to_s.upcase, count: 2
    assert_select 'tr>td', text: '4512'.to_s, count: 2
    assert_select 'tr>td', text: 'Nome'.to_s.upcase, count: 2
  end
end
