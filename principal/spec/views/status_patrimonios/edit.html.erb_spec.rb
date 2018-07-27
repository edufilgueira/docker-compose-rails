# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'status_patrimonios/edit', type: :view do
  before(:each) do
    @status_patrimonio = assign(:status_patrimonio, FactoryBot.create(:status_patrimonio))
  end

  it 'renders the edit status_patrimonio form' do
    render

    assert_select 'form[action=?][method=?]', status_patrimonio_path(@status_patrimonio), 'post' do
      assert_select 'input[name=?]', 'status_patrimonio[nome]'

      assert_select 'input[name=?]', 'status_patrimonio[descricao]'
    end
  end
end
