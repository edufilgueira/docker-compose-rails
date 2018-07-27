# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'solicitacao_transportes/show', type: :view do
  before(:each) do
    @solicitacao_transporte = assign(:solicitacao_transporte, FactoryBot.create(:solicitacao_transporte))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyString/)
    expect(rendered).to match(/MyString/)
    expect(rendered).to match(/MyString/)
    expect(rendered).to match(/MyString/)
    expect(rendered).to match(/MyString/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyString/)
  end
end
