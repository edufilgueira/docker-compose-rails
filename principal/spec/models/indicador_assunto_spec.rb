# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IndicadorAssunto, type: :model do
  subject { FactoryBot.create(:indicador_assunto) }
  it 'deve imprimir o nome no to_s' do
    subject.nome = 'foobar'
    expect(subject.to_s).to eq(subject.nome)
  end
end
