# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'categoria_patrimonios/index', type: :view do
  before(:each) do
    @categoria_patrimonio = FactoryBot.create(:categoria_patrimonio)
    assign(:categoria_patrimonios, [@categoria_patrimonio, @categoria_patrimonio])
  end

  it 'renders a list of categoria_patrimonios' do
    render
    assert_select 'tr>td', text: @categoria_patrimonio.nome.to_s.upcase, count: 2
  end
end
