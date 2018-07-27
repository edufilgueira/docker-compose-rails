# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tipo_solicitacao_transportes/show', type: :view do
  before(:each) do
    @tipo_solicitacao_transporte = assign(:tipo_solicitacao_transporte, TipoSolicitacaoTransporte.create!(
                                                                          tipo: 'Tipo'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Tipo/)
  end
end
