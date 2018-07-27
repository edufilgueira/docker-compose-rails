# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'funcao_pessoas/index', type: :view do
  before(:each) do
    @funcao_pessoas = assign(:funcao_pessoa, [FactoryBot.create(:funcao_pessoa), FactoryBot.create(:funcao_pessoa)])
  end

  it 'renders a list of funcao_pessoas' do
    render
    assert_select 'tr>td', text: 'NomeDaFuncao', count: 2
  end
end
