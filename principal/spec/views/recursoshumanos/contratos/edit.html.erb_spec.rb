# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recursoshumanos/contratos/edit', type: :view do
  before(:each) do
    @recursoshumanos_contrato = assign(:recursoshumanos_contrato, FactoryBot.create(:recursoshumanos_contrato))
  end

  it 'renders the edit recursoshumanos_contrato form' do
    render

    assert_select 'form[action=?][method=?]', recursoshumanos_contrato_path(@recursoshumanos_contrato), 'post' do
      assert_select 'select[name=?]', 'recursoshumanos_contrato[recursoshumanos_tipo_legal_id]'

      assert_select 'input[name=?]', 'recursoshumanos_contrato[numero]'

      assert_select 'input[name=?]', 'recursoshumanos_contrato[ano]'

      assert_select 'input[name=?]', 'recursoshumanos_contrato[doe_ce]'

      assert_select 'input[name=?]', 'recursoshumanos_contrato[pagina_doe_ce]'
    end
  end
end
