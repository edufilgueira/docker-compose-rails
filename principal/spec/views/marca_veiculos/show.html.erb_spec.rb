# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'marca_veiculos/show', type: :view do
  before(:each) do
    @marca_veiculo = assign(:marca_veiculo, MarcaVeiculo.create!(
                                              marca: 'Marca'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Marca/)
  end
end
