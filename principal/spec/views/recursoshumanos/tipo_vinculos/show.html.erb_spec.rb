# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recursoshumanos/tipo_vinculos/show', type: :view do
  before(:each) do
    @recursoshumanos_tipo_vinculo = assign(:recursoshumanos_tipo_vinculo, Recursoshumanos::TipoVinculo.create!(
                                                                            nome: 'Nome'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Nome/)
  end
end
