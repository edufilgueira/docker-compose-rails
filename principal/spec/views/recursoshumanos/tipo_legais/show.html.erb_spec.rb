# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recursoshumanos/tipo_legais/show', type: :view do
  before(:each) do
    @recursoshumanos_tipo_legal = assign(:recursoshumanos_tipo_legal, FactoryBot.create(:recursoshumanos_tipo_legal))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyString/)
  end
end
