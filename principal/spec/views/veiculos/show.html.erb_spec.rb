# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'veiculos/show', type: :view do
  before(:each) do
    @veiculos = assign(:veiculo, FactoryBot.create(:veiculo))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Placa/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
