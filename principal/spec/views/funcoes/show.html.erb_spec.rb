# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'funcoes/show', type: :view do
  before(:each) do
    @funcao = assign(:funcao, FactoryBot.create(:funcao))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(@funcao.nome)
    expect(rendered).to match(//)
  end
end
