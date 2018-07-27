# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'indicador_assuntos/show', type: :view do
  before(:each) do
    @indicador_assunto = assign(:indicador_assunto, IndicadorAssunto.create!(
                                                      nome: 'Nome'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Nome/)
  end
end
