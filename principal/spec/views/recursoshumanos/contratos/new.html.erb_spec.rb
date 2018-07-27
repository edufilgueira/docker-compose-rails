# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recursoshumanos/contratos/new', type: :view do
  before(:each) do
    assign(:recursoshumanos_contrato, FactoryBot.build(:recursoshumanos_contrato))
  end

  it 'renders new recursoshumanos_contrato form' do
    render

    assert_select 'form[action=?][method=?]', recursoshumanos_contratos_path, 'post' do
      assert_select 'select[name=?]', 'recursoshumanos_contrato[recursoshumanos_tipo_legal_id]'

      assert_select 'input[name=?]', 'recursoshumanos_contrato[numero]'

      assert_select 'input[name=?]', 'recursoshumanos_contrato[ano]'

      assert_select 'input[name=?]', 'recursoshumanos_contrato[doe_ce]'

      assert_select 'input[name=?]', 'recursoshumanos_contrato[pagina_doe_ce]'
    end
  end
end
