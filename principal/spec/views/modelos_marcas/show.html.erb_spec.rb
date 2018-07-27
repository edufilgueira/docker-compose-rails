# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'modelos_marcas/show', type: :view do
  before(:each) do
    @modelos_marcas = assign(:modelos_marca, FactoryBot.create(:modelos_marca))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Modelo/)
    expect(rendered).to match(//)
  end
end
