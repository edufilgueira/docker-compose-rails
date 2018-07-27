# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recursoshumanos/tipo_vinculos/new', type: :view do
  before(:each) do
    assign(:recursoshumanos_tipo_vinculo, Recursoshumanos::TipoVinculo.new(
                                            nome: 'MyString'
    ))
  end

  it 'renders new recursoshumanos_tipo_vinculo form' do
    render

    assert_select 'form[action=?][method=?]', recursoshumanos_tipo_vinculos_path, 'post' do
      assert_select 'input[name=?]', 'recursoshumanos_tipo_vinculo[nome]'
    end
  end
end
