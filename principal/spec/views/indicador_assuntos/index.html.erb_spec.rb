# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'indicador_assuntos/index', type: :view do
  before(:each) do
    assign(:indicador_assuntos, [
             IndicadorAssunto.create!(
               nome: 'Nome'
             ),
             IndicadorAssunto.create!(
               nome: 'Nome'
             )
           ])
  end

  it 'renders a list of indicador_assuntos' do
    render
    assert_select 'tr>td', text: 'Nome'.to_s, count: 2
  end
end
