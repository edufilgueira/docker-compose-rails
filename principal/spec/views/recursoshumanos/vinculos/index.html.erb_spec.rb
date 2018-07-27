# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recursoshumanos/vinculos/index', type: :view do
  before(:each) do
    @vinculos = assign(:recursoshumanos_vinculos, [FactoryBot.create(:recursoshumanos_vinculo)])
    assign(:vinculos_group_by_tipo_legal, { @vinculos.last.recursoshumanos_tipo_legal => [@vinculos.last] } )
    assign(:vinculos_desligados, [FactoryBot.create(:recursoshumanos_vinculo, {data_fim: Time.now})])
  end

  it 'renders a list of recursoshumanos/vinculos' do
    render
    assert_select '#tab-desligados' do
      assert_select 'tr>td.client-status', text: 'Desligado'
    end

    assert_select '#tab-'+@vinculos.last.recursoshumanos_tipo_legal.to_param do
      assert_select 'tr>td.client-status', text: 'Ativo'
    end

    assert_select 'tr>td', text: Time.now.strftime("%d/%m/%Y"), count: 1
  end
end
