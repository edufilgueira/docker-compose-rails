# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'grupo_patrimonios/index', type: :view do
  before(:each) do
    assign(:grupo_patrimonios, [
             GrupoPatrimonio.create!(
               codigo: 'Codigo',
               nome: 'Nome'
             ),
             GrupoPatrimonio.create!(
               codigo: 'Codigo',
               nome: 'Nome'
             )
           ])
  end

  it 'renders a list of grupo_patrimonios' do
    render
    assert_select 'tr>td', text: 'Codigo'.to_s, count: 2
    assert_select 'tr>td', text: 'Nome'.to_s.upcase, count: 2
  end
end
