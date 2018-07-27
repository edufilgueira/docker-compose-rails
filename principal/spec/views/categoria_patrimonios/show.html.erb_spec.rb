# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'categoria_patrimonios/show', type: :view do
  before(:each) do
    @categoria_patrimonio = assign(:categoria_patrimonio, CategoriaPatrimonio.create!(
                                                            nome: 'Nome'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Nome/)
  end
end
