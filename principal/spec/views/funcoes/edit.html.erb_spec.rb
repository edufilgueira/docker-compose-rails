# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'funcoes/edit', type: :view do
  before(:each) do
    @funcao = assign(:funcao, FactoryBot.create(:funcao))
  end

  it 'renders the edit funcao form' do
    render

    assert_select 'form[action=?][method=?]', funcao_path(@funcao), 'post' do
      assert_select 'input[name=?]', 'funcao[nome]'

      assert_select 'select[name=?]', 'funcao[area_id]'
    end
  end
end
