# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'marca_veiculos/edit', type: :view do
  before(:each) do
    @marca_veiculo = assign(:marca_veiculo, MarcaVeiculo.create!(
                                              marca: 'MyString'
    ))
  end

  it 'renders the edit marca_veiculo form' do
    render

    assert_select 'form[action=?][method=?]', marca_veiculo_path(@marca_veiculo), 'post' do
      assert_select 'input[name=?]', 'marca_veiculo[marca]'
    end
  end
end
