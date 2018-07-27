# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'modelos_marcas/new', type: :view do
  before(:each) do
    @modelos_marca = assign(:modelos_marca, FactoryBot.build(:modelos_marca))
  end

  it 'renders new modelos_marca form' do
    render

    assert_select 'form[action=?][method=?]', modelos_marcas_path, 'post' do
      assert_select 'input[name=?]', 'modelos_marca[modelo]'

      assert_select 'select[name=?]', 'modelos_marca[marca_veiculo_id]'
    end
  end
end
