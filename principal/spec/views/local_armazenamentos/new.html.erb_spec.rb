# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'local_armazenamentos/new', type: :view do
  before(:each) do
    assign(:local_armazenamento, FactoryBot.build(:local_armazenamento))
  end

  it 'renders new local_armazenamento form' do
    render

    assert_select 'form[action=?][method=?]', local_armazenamentos_path, 'post' do
      assert_select 'input[name=?]', 'local_armazenamento[descricao_local]'

      assert_select 'select[name=?]', 'local_armazenamento[unidade_socioeducativa_id]'
    end
  end
end
