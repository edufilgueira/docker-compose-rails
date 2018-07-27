# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'veiculos/edit', type: :view do
  before(:each) do
    @veiculos = assign(:veiculo, FactoryBot.create(:veiculo))
  end

  it 'renders the edit veiculo form' do
    render

    assert_select 'form[action=?][method=?]', veiculo_path(@veiculos), 'post' do
      assert_select 'input[name=?]', 'veiculo[placa]'

      assert_select 'select[name=?]', 'veiculo[modelos_marca_id]'
    end
  end
end
