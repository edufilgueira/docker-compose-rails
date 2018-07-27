# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tipo_de_combustiveis/show', type: :view do
  before(:each) do
    @tipo_de_combustiveis = assign(:tipo_de_combustivel, FactoryBot.create(:tipo_de_combustivel))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(@tipo_de_combustiveis.nome)
  end
end
