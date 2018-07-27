# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'solicitacao_transportes/edit', type: :view do
  before(:each) do
    @solicitacao_transporte = assign(:solicitacao_transporte, FactoryBot.create(:solicitacao_transporte))
  end

  it 'renders the edit solicitacao_transporte form' do
    render

    assert_select 'form[action=?][method=?]', solicitacao_transporte_path(@solicitacao_transporte), 'post' do
      assert_select 'select[name=?]', 'solicitacao_transporte[tipo_solicitacao_transporte_id]'

      assert_select 'select[name=?]', 'solicitacao_transporte[area_id]'

      assert_select 'select[name=?]', 'solicitacao_transporte[destinado_para_id]'

      assert_select 'input[name=?]', 'solicitacao_transporte[destino]'

      assert_select 'textarea[name=?]', 'solicitacao_transporte[justificativa]'

      assert_select 'input[name=?]', 'solicitacao_transporte[urgente]'

      assert_select 'textarea[name=?]', 'solicitacao_transporte[justificativa_urgencia]'
    end
  end
end
