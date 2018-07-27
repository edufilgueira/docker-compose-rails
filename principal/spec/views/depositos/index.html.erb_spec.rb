# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'depositos/index', type: :view do
  before(:each) do
    assign(:depositos, [
             Deposito.create!(
               nome: 'Nome'
             ),
             Deposito.create!(
               nome: 'Nome'
             )
           ])
  end

  it 'renders a list of depositos' do
    render
    assert_select 'tr>td', text: 'Nome'.to_s.upcase, count: 2
  end
end
