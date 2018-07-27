# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recursoshumanos/vinculos/new', type: :view do
  before(:each) do
    assign(:recursoshumanos_vinculo, FactoryBot.build(:recursoshumanos_vinculo_ativo))
    assign(:lista_de_cargos, Recursoshumanos::Cargo.com_vagas_disponiveis)
    assign(:lista_de_pessoas, Pessoa.sem_cargo)
  end

  it 'renders new recursoshumanos_vinculo form' do
    render

    assert_select 'form[action=?][method=?]', recursoshumanos_vinculos_path, 'post' do
      assert_select 'select[name=?]', 'recursoshumanos_vinculo[recursoshumanos_cargo_id]'

      assert_select 'select[name=?]', 'recursoshumanos_vinculo[pessoas_id]'
    end
  end
end
