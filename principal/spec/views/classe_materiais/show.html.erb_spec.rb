# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'classe_materiais/show', type: :view, class: :ClasseMaterial do
  before(:each) do
    @classe_material = assign(:classe_material, FactoryBot.create(:classe_material))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Nome/)
  end
end
