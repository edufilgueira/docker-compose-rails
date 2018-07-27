# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pessoas/contratacao', type: :view do
  before(:each) do
    assign(:pessoa, FactoryBot.build(:pessoa))
  end

  it 'renders new contratacao form' do
    render

    assert_select 'form[action=?][method=?]', pessoas_path, 'post' do
      assert_select 'input[name=?]', 'pessoa[nome]'
      assert_select 'input[name=?]', 'pessoa[cpf]'
    end
  end
end
