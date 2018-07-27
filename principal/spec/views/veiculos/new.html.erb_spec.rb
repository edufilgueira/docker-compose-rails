# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'veiculos/new', type: :view do
  before(:each) do
    @veiculos = assign(:veiculo, FactoryBot.build(:veiculo))
  end

  it 'renders new veiculo form' do
    render

    assert_select 'form[action=?][method=?]', veiculos_path, 'post' do
      assert_select 'input[name=?]', 'veiculo[placa]'

      assert_select 'select[name=?]', 'veiculo[modelos_marca_id]'
    end
  end
end
