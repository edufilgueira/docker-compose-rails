# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'status_patrimonios/index', type: :view do
  before(:each) do
    @status_patrimonio = FactoryBot.create(:status_patrimonio)
    assign(:status_patrimonios, [@status_patrimonio, @status_patrimonio])
  end

  it 'renders a list of status_patrimonios' do
    render
    assert_select 'tr>td', text: @status_patrimonio.nome.to_s.upcase, count: 2
    assert_select 'tr>td', text: @status_patrimonio.descricao.to_s.upcase, count: 2
  end
end
