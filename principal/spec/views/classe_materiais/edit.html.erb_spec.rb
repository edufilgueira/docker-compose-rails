# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'classe_materiais/edit', type: :view do
  before(:each) do
    @classe_material = assign(:classe_material, FactoryBot.create(:classe_material))
  end

  it 'renders the edit classe_material form' do
    render

    assert_select 'form[action=?][method=?]', classe_material_path(@classe_material), 'post' do
      assert_select 'select[name=?]', 'classe_material[grupo_material_id]'
      assert_select 'input[name=?]', 'classe_material[nome]'
    end
  end
end
