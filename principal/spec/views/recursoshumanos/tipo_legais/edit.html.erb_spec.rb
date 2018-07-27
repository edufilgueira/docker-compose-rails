# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recursoshumanos/tipo_legais/edit', type: :view do
  before(:each) do
    @recursoshumanos_tipo_legal = assign(:recursoshumanos_tipo_legal, FactoryBot.create(:recursoshumanos_tipo_legal))
  end

  it 'renders the edit recursoshumanos_tipo_legal form' do
    render

    assert_select 'form[action=?][method=?]', recursoshumanos_tipo_legal_path(@recursoshumanos_tipo_legal), 'post' do
      assert_select 'input[name=?]', 'recursoshumanos_tipo_legal[nome]'
    end
  end
end
