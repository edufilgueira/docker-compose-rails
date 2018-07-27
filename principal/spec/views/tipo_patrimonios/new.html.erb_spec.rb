# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tipo_patrimonios/new', type: :view do
  before(:each) do
    assign(:tipo_patrimonio, FactoryBot.build(:tipo_patrimonio))
  end

  it 'renders new tipo_patrimonio form' do
    render

    assert_select 'form[action=?][method=?]', tipo_patrimonios_path, 'post' do
      assert_select 'input[name=?]', 'tipo_patrimonio[nome]'
    end
  end
end
