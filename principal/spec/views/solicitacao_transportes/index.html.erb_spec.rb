# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'solicitacao_transportes/index', type: :view do
  sign_in_user
  before(:each) do
    @solicitacao_transporte = assign(:solicitacao_transportes, [FactoryBot.create(:solicitacao_transporte), FactoryBot.create(:solicitacao_transporte)])
    assign(:solicitacoes, [FactoryBot.create(:solicitacao_transporte), FactoryBot.create(:solicitacao_transporte)])
  end

  it 'renders a list of solicitacao_transportes' do
    render
    assert_select 'tr>td', text: 'MyString'
    assert_select 'tr>td', text: 'MyString'
    assert_select 'tr>td', text: 'MyString'
    assert_select 'tr>td', text: 'MyString'
    assert_select 'tr>td', text: 'MyString'
    assert_select 'tr>td', text: false
    assert_select 'tr>td', text: 'MyString'
  end
end
