# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'marca_veiculos/new', type: :view do
  before(:each) do
    assign(:marca_veiculo, MarcaVeiculo.new(
                             marca: 'MyString'
    ))
  end

  it 'renders new marca_veiculo form' do
    render

    assert_select 'form[action=?][method=?]', marca_veiculos_path, 'post' do
      assert_select 'input[name=?]', 'marca_veiculo[marca]'
    end
  end
end
