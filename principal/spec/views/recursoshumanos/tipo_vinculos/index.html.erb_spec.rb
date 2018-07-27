# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recursoshumanos/tipo_vinculos/index', type: :view do
  before(:each) do
    assign(:recursoshumanos_tipo_vinculos, [
             Recursoshumanos::TipoVinculo.create!(
               nome: 'Nome'
             ),
             Recursoshumanos::TipoVinculo.create!(
               nome: 'Nome'
             )
           ])
  end

  it 'renders a list of recursoshumanos/tipo_vinculos' do
    render
    assert_select 'tr>td', text: 'Nome'.to_s, count: 2
  end
end
