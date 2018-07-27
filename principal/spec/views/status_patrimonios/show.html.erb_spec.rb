# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'status_patrimonios/show', type: :view do
  before(:each) do
    @status_patrimonio = assign(:status_patrimonio, FactoryBot.create(:status_patrimonio))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(@status_patrimonio.nome)
    expect(rendered).to match(@status_patrimonio.descricao)
  end
end
