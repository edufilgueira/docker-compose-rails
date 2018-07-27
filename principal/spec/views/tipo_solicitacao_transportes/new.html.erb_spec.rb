# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tipo_solicitacao_transportes/new', type: :view do
  before(:each) do
    assign(:tipo_solicitacao_transporte, TipoSolicitacaoTransporte.new(
                                           tipo: 'MyString'
    ))
  end

  it 'renders new tipo_solicitacao_transporte form' do
    render

    assert_select 'form[action=?][method=?]', tipo_solicitacao_transportes_path, 'post' do
      assert_select 'input[name=?]', 'tipo_solicitacao_transporte[tipo]'
    end
  end
end
