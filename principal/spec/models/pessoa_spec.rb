# -*- coding: utf-8 -*-

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pessoa, type: :model do
  subject { FactoryBot.create(:pessoa) }

  it 'respond the name to to_s' do
    expect(subject.to_s).to be == subject.nome.upcase
  end

  context 'com duas pessoas uma ambas sem cargo' do
    before(:all) do
      Recursoshumanos::Vinculo.delete_all
      Pessoa.delete_all
      2.times { FactoryBot.create(:pessoa) }
    end

    it 'mostra duas pessoas sem cargo' do
      expect(described_class.sem_cargo.size).to be == 2
    end
  end

  context 'com duas pessoas uma com cargo e outra sem' do
    before(:all) do
      Recursoshumanos::Vinculo.delete_all
      Pessoa.delete_all
      FactoryBot.create(:pessoa)
      FactoryBot.create(:recursoshumanos_vinculo_ativo)
    end

    it 'mostra uma pessoas sem cargo' do
      expect(described_class.sem_cargo.size).to be == 1
    end
  end

  context 'com duas pessoas uma ambas com cargo' do
    before(:all) do
      Recursoshumanos::Vinculo.delete_all
      Pessoa.delete_all
      2.times { FactoryBot.create(:recursoshumanos_vinculo_ativo) }
    end

    it 'mostra uma pessoas sem cargo' do
      expect(described_class.sem_cargo.size).to be == 0
    end
  end

  it 'deve responder a possui_funcao?' do
    expect(subject).to respond_to(:possui_funcao?)
  end

  it 'nao tem nenhuma funcao teste a principio' do
    expect(subject.possui_funcao?('Motorista')).to be false
  end

  it 'após ser atribuida uma função a principio' do
    funcao = FactoryBot.create(:funcao_motorista)
    subject.funcoes = [funcao]
    expect(subject.possui_funcao?('Motorista')).to be true
  end

  it {
    should have_many(:funcoes).through(:funcao_pessoa)
    should have_many(:funcao_pessoa)
  }
end
