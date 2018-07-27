# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Indicador, type: :model do
  subject { described_class.new }
  it 'is able to tell me my sentido options' do
    expect(described_class.possiveis_sentidos).to be_kind_of(Array)
  end

  it 'sentido quanto igual melhor options' do
    expect(described_class.possiveis_sentidos).to include('Quanto IGUAL melhor')
  end

  it 'must have at least one sentido to be choosen' do
    expect(described_class.possiveis_sentidos.size).to be > 0
  end

  it 'is able to tell me my periodicidade_coleta options' do
    expect(described_class.possiveis_periodicidade_coleta).to be_kind_of(Array)
  end

  it 'must have at least one periodicidade_coleta to be choosen' do
    expect(described_class.possiveis_periodicidade_coleta.size).to be > 0
  end

  it 'is able to tell me my periodicidade_avaliacao options' do
    expect(described_class.possiveis_periodicidade_avaliacao).to be_kind_of(Array)
  end

  it 'must have at least one periodicidade_avaliacao to be choosen' do
    expect(described_class.possiveis_periodicidade_avaliacao.size).to be > 0
  end

  it 'must have at least one possiveis_abrangencias to be choosen' do
    expect(described_class.possiveis_abrangencias.size).to be > 0
  end

  it 'needs an indicador_assunto' do
    indicador = FactoryBot.build(:indicador)
    expect(indicador.valid?).to be true
    indicador.indicador_assunto = nil
    expect(indicador.valid?).to be false
  end

  it 'respond to to_s with nome' do
    subject.nome = 'foobar'
    expect(subject.nome).to be_eql('foobar')
    expect(subject.to_s).to be_eql(subject.nome)
  end
end
