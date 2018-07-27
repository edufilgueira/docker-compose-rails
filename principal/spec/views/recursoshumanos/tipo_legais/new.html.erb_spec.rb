# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recursoshumanos/tipo_legais/new', type: :view do
  before(:each) do
    assign(:recursoshumanos_tipo_legal, FactoryBot.build(:recursoshumanos_tipo_legal))
  end

  it 'renders new recursoshumanos_tipo_legal form' do
    render

    assert_select 'form[action=?][method=?]', recursoshumanos_tipo_legais_path, 'post' do
      assert_select 'input[name=?]', 'recursoshumanos_tipo_legal[nome]'
    end
  end
end
