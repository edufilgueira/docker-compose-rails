# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'classe_patrimonios/show', type: :view do
  before(:each) do
    @classe_patrimonio = assign(:classe_patrimonio, FactoryBot.create(:classe_patrimonio))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(@classe_patrimonio.codigo)
    expect(rendered).to match(@classe_patrimonio.nome)
  end
end
