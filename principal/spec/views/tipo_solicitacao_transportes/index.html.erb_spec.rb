# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tipo_solicitacao_transportes/index', type: :view do
  before(:each) do
    assign(:tipo_solicitacao_transportes, [
             TipoSolicitacaoTransporte.create!(
               tipo: 'Tipo'
             ),
             TipoSolicitacaoTransporte.create!(
               tipo: 'Tipo'
             )
           ])
  end

  it 'renders a list of tipo_solicitacao_transportes' do
    render
    assert_select 'tr>td', text: 'Tipo'.to_s, count: 2
  end
end
