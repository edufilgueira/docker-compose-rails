# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'patrimonios/index', type: :view do
  before(:each) do
    @patrimonio = FactoryBot.create(:patrimonio)
    assign(:patrimonios, [@patrimonio, @patrimonio])
  end

  it 'renders a list of patrimonios' do
    render
    assert_select 'tr>td', text: @patrimonio.item_patrimonio.to_s.upcase, count: 2
  end
end
