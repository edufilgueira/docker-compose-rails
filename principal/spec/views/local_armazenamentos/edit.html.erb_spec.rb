# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'local_armazenamentos/edit', type: :view do
  before(:each) do
    @local_armazenamento = assign(:local_armazenamento, LocalArmazenamento.create!(
                                                          descricao_local: 'MyString',
                                                          unidade_socioeducativa: FactoryBot.create(:unidade_socioeducativa)
    ))
  end

  it 'renders the edit local_armazenamento form' do
    render

    assert_select 'form[action=?][method=?]', local_armazenamento_path(@local_armazenamento), 'post' do
      assert_select 'input[name=?]', 'local_armazenamento[descricao_local]'

      assert_select 'select[name=?]', 'local_armazenamento[unidade_socioeducativa_id]'
    end
  end
end
