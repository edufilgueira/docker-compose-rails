# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'local_armazenamentos/show', type: :view do
  before(:each) do
    @local_armazenamento = assign(:local_armazenamento, LocalArmazenamento.create!(
                                                          descricao_local: 'Descricao Local',
                                                          unidade_socioeducativa: FactoryBot.create(:unidade_socioeducativa)
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Descricao Local/)
    expect(rendered).to match(//)
  end
end
