# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'classe_materiais/new', type: :view do
  before(:each) do
    assign(:classe_material, ClasseMaterial.new(
                               nome: 'MyString'
    ))
  end

  it 'renders new classe_material form' do
    render

    assert_select 'form[action=?][method=?]', classe_materiais_path, 'post' do
      assert_select 'input[name=?]', 'classe_material[nome]'
    end
  end
end
