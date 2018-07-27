# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tipo_patrimonios/edit', type: :view do
  before(:each) do
    @tipo_patrimonio = assign(:tipo_patrimonio, FactoryBot.create(:tipo_patrimonio))
  end

  it 'renders the edit tipo_patrimonio form' do
    render

    assert_select 'form[action=?][method=?]', tipo_patrimonio_path(@tipo_patrimonio), 'post' do
      assert_select 'input[name=?]', 'tipo_patrimonio[nome]'
    end
  end
end
