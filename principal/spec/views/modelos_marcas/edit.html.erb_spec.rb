# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'modelos_marcas/edit', type: :view do
  before(:each) do
    @modelos_marcas = assign(:modelos_marca, FactoryBot.create(:modelos_marca))
  end

  it 'renders the edit modelos_marca form' do
    render

    assert_select 'form[action=?][method=?]', modelos_marca_path(@modelos_marcas), 'post' do
      assert_select 'input[name=?]', 'modelos_marca[modelo]'

      assert_select 'select[name=?]', 'modelos_marca[marca_veiculo_id]'
    end
  end
end
