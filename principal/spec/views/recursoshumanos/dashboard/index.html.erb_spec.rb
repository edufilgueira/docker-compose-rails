
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recursoshumanos/dashboard/index.html.erb', type: :view do
  it 'deve ter box informativos' do
    dashboard = Recursoshumanos::Dashboard.new
    allow(dashboard).to receive(:quantidade_cargos).and_return(2)
    allow(dashboard).to receive(:colaboradores_ativos).and_return(1)
    allow(dashboard).to receive(:quantidade_entradas).and_return(2)
    allow(dashboard).to receive(:quantidade_saidas).and_return(1)
    assign(:dashboard, dashboard)

    render
    expect(rendered).to match 'Cargos'
    expect(rendered).to match 'Colaboradores'
    expect(rendered).to match 'Entradas'
    expect(rendered).to match 'Sa&iacute;das'
  end

  context 'com 2 pessoas contratadas e 1 desligada esse mes' do
    it 'deve conter quantidade de cargos' do
      dashboard = Recursoshumanos::Dashboard.new
      allow(dashboard).to receive(:quantidade_cargos).and_return(2)
      allow(dashboard).to receive(:colaboradores_ativos).and_return(1)
      allow(dashboard).to receive(:quantidade_entradas).and_return(2)
      allow(dashboard).to receive(:quantidade_saidas).and_return(1)
      assign(:dashboard, dashboard)

      render
      assert_select 'div#quantidade_cargos h1', html: Regexp.new('2'), count: 1
      assert_select 'div#quantidade_colaboradores h1', html: Regexp.new('1'), count: 1
      assert_select 'div#quantidade_entrada h1', html: Regexp.new('2'), count: 1
      assert_select 'div#quantidade_saida h1', html: Regexp.new('1'), count: 1
    end
  end

  context 'com 2 pessoas contratadas e 0 desligada esse mes' do
    it 'deve conter quantidade de cargos' do
      dashboard = Recursoshumanos::Dashboard.new
      allow(dashboard).to receive(:quantidade_cargos).and_return(2)
      allow(dashboard).to receive(:colaboradores_ativos).and_return(2)
      allow(dashboard).to receive(:quantidade_entradas).and_return(2)
      allow(dashboard).to receive(:quantidade_saidas).and_return(0)
      assign(:dashboard, dashboard)

      render
      assert_select 'div#quantidade_cargos h1', html: Regexp.new('2'), count: 1
      assert_select 'div#quantidade_colaboradores h1', html: Regexp.new('2'), count: 1
      assert_select 'div#quantidade_entrada h1', html: Regexp.new('2'), count: 1
      assert_select 'div#quantidade_saida h1', html: Regexp.new('0'), count: 1
    end
  end
end
