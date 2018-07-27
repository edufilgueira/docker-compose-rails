# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'mapa_de_bordos/show', type: :view do
  before(:each) do

    @mapa_de_bordo = assign(:mapa_de_bordo, FactoryBot.create(:mapa_de_bordo))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
