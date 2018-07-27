# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ColetaIndicador, type: :model do
  subject { FactoryBot.build(:coleta_indicador) }

  it 'validates semestre so pode haver ate 2 semestres' do
    subject.semestre = 3
    expect(subject.valid?).to be false

    subject.semestre = 2
    expect(subject.valid?).to be true
  end

  it 'validates trimestre so pode haver ate 4 trimestres' do
    subject.trimestre = 5
    expect(subject.valid?).to be false

    subject.trimestre = 4
    expect(subject.valid?).to be true
  end

  it 'validates quadrimestre so pode haver ate 3 quadrimestres' do
    subject.quadrimestre = 6
    expect(subject.valid?).to be false

    subject.quadrimestre = 3
    expect(subject.valid?).to be true
  end

  it 'validates quinzena so pode haver ate 2 quinzenas' do
    subject.quinzena = 3
    expect(subject.valid?).to be false

    subject.quinzena = 2
    expect(subject.valid?).to be true

    subject.quinzena = 1
    expect(subject.valid?).to be true
  end

  it 'validates semana so pode haver ate 5 semanas' do
    subject.semana = 6
    expect(subject.valid?).to be false

    subject.semana = 5
    expect(subject.valid?).to be true

    subject.semana = 1
    expect(subject.valid?).to be true
  end

  it 'validates mes so pode haver ate 12 meses' do
    subject.mes = 13
    expect(subject.valid?).to be false

    subject.mes = 12
    expect(subject.valid?).to be true

    subject.mes = 5
    expect(subject.valid?).to be true
  end

  it 'validate indice presence' do
    expect(subject.valid?).to be true
    subject.indice = nil
    expect(subject.valid?).to be false
  end

  it 'knows it periodicidades' do
    expect(described_class.periodicidades).to be_instance_of(Array)
    expect(described_class.periodicidades.size).to be > 0
  end
end
