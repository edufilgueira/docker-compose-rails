# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tipo_patrimonios/index', type: :view do
  before(:each) do
    @tipo_patrimonio = FactoryBot.create(:tipo_patrimonio)
    assign(:tipo_patrimonios, [@tipo_patrimonio, @tipo_patrimonio])
  end

  it 'renders a list of tipo_patrimonios' do
    render
    assert_select 'tr>td', text: @tipo_patrimonio.nome.to_s.upcase, count: 2
  end
end
