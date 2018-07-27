# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'status_patrimonios/new', type: :view do
  before(:each) do
    assign(:status_patrimonio, FactoryBot.build(:status_patrimonio))
  end

  it 'renders new status_patrimonio form' do
    render

    assert_select 'form[action=?][method=?]', status_patrimonios_path, 'post' do
      assert_select 'input[name=?]', 'status_patrimonio[nome]'

      assert_select 'input[name=?]', 'status_patrimonio[descricao]'
    end
  end
end
