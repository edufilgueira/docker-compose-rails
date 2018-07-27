# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'patrimonios/show', type: :view do
  before(:each) do
    @patrimonio = assign(:patrimonio, FactoryBot.create(:patrimonio))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(@patrimonio.tombo_anterior)
    expect(rendered).to match(@patrimonio.origem_anterior)
    expect(rendered).to match(@patrimonio.tombo_atual)
    expect(rendered).to match(@patrimonio.origem_atual)
    expect(rendered).to match(@patrimonio.valor.to_s)
    expect(rendered).to match(@patrimonio.ciclo_vida_util)
  end
end
