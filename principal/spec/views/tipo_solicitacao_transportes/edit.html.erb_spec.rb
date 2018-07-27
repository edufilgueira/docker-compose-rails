# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tipo_solicitacao_transportes/edit', type: :view do
  before(:each) do
    @tipo_solicitacao_transporte = assign(:tipo_solicitacao_transporte, TipoSolicitacaoTransporte.create!(
                                                                          tipo: 'MyString'
    ))
  end

  it 'renders the edit tipo_solicitacao_transporte form' do
    render

    assert_select 'form[action=?][method=?]', tipo_solicitacao_transporte_path(@tipo_solicitacao_transporte), 'post' do
      assert_select 'input[name=?]', 'tipo_solicitacao_transporte[tipo]'
    end
  end
end
