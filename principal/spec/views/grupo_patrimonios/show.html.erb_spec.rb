# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'grupo_patrimonios/show', type: :view do
  before(:each) do
    @grupo_patrimonio = assign(:grupo_patrimonio, GrupoPatrimonio.create!(
                                                    codigo: 'Codigo',
                                                    nome: 'Nome'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Codigo/)
    expect(rendered).to match(/Nome/)
  end
end
