# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recursoshumanos/tipo_vinculos/edit', type: :view do
  before(:each) do
    @recursoshumanos_tipo_vinculo = assign(:recursoshumanos_tipo_vinculo, Recursoshumanos::TipoVinculo.create!(
                                                                            nome: 'MyString'
    ))
  end

  it 'renders the edit recursoshumanos_tipo_vinculo form' do
    render

    assert_select 'form[action=?][method=?]', recursoshumanos_tipo_vinculo_path(@recursoshumanos_tipo_vinculo), 'post' do
      assert_select 'input[name=?]', 'recursoshumanos_tipo_vinculo[nome]'
    end
  end
end
