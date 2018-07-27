# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'indicadores/list.html.erb', type: :view do
  before(:each) do
    @indicadores = assign(:indicadores, [FactoryBot.create(:indicador)])
  end

  it 'renders the edit indicador_unidade_medida form' do
    render

    assert_select 'td', @indicadores.first.indicador_assunto.nome
  end
end
