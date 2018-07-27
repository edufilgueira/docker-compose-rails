# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'funcao_pessoas/edit', type: :view do
  before(:each) do
    @funcao_pessoa = assign(:funcao_pessoa, FactoryBot.create(:funcao_pessoa))
  end

  it 'renders the edit funcao_pessoa form' do
    render
    assert_select 'form[action=?][method=?]', funcao_pessoa_path(@funcao_pessoa), 'post' do
      assert_select 'select[name=?]', 'funcao_pessoa[funcao_id]'
    end
  end
end
