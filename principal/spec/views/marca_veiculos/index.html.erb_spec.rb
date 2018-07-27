# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'marca_veiculos/index', type: :view do
  before(:each) do
    assign(:marca_veiculos, [
             MarcaVeiculo.create!(
               marca: 'Marca'
             ),
             MarcaVeiculo.create!(
               marca: 'Marca'
             )
           ])
  end

  it 'renders a list of marca_veiculos' do
    render
    assert_select 'tr>td', text: 'Marca'.to_s, count: 2
  end
end
