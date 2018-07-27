# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recursoshumanos/vinculos/edit', type: :view do
  before(:each) do
    @recursoshumanos_vinculo = assign(:recursoshumanos_vinculo, FactoryBot.create(:recursoshumanos_vinculo))
    assign(:lista_de_cargos, Recursoshumanos::Cargo.com_vagas_disponiveis)
    assign(:lista_de_pessoas, Pessoa.sem_cargo)
  end

  it 'renders the edit recursoshumanos_vinculo form' do
    render

    assert_select 'form[action=?][method=?]', recursoshumanos_vinculo_path(@recursoshumanos_vinculo), 'post' do
      assert_select 'select[name=?]', 'recursoshumanos_vinculo[recursoshumanos_cargo_id]'

      assert_select 'select[name=?]', 'recursoshumanos_vinculo[pessoas_id]'
    end
  end
end
