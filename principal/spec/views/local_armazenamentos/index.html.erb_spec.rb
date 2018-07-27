# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'local_armazenamentos/index', type: :view do
  before(:each) do
    assign(:local_armazenamentos, [
             LocalArmazenamento.create!(
               descricao_local: 'Descricao Local',
               unidade_socioeducativa: FactoryBot.create(:unidade_socioeducativa)
             ),
             LocalArmazenamento.create!(
               descricao_local: 'Descricao Local',
               unidade_socioeducativa: FactoryBot.create(:unidade_socioeducativa)
             )
           ])
  end

  it 'renders a list of local_armazenamentos' do
    render
    assert_select 'tr>td', text: 'Descricao Local'.to_s, count: 2
  end
end
