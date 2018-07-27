# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tipo_patrimonios/show', type: :view do
  before(:each) do
    @tipo_patrimonio = assign(:tipo_patrimonio, FactoryBot.create(:tipo_patrimonio))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(@tipo_patrimonio.nome)
  end
end
