# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'funcao_pessoas/new', type: :view do
  before(:each) do
    @funcao_pessoas = assign(:funcao_pessoa, FactoryBot.build(:funcao_pessoa))
  end

  it 'renders new funcao_pessoas_form' do
    render

    assert_select 'form[action=?][method=?]', funcao_pessoas_path, 'post' do
      assert_select 'select[name=?]', 'funcao_pessoa[funcao_id]'
    end
  end
end
