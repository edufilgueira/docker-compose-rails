# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recursoshumanos::Cargo, type: :model do
  context 'com um cargo com 2 vagas' do
    before(:all) do
      Recursoshumanos::Vinculo.delete_all
      Recursoshumanos::Cargo.delete_all
      FactoryBot.create(:recursoshumanos_cargo, quantidade: 2)
    end
    context 'duas livres' do
      it 'deve informar que tem 2 vagas' do
        expect(described_class.total_de_vagas).to be_eql(2)
      end

      it 'deve possuir um cargo com vaga disponivel' do
        expect(described_class.com_vagas_disponiveis.size).to be_eql(1)
      end
    end

    context 'uma ocupada e uma livre' do
      before (:all) do
        Recursoshumanos::Vinculo.delete_all
        Recursoshumanos::Cargo.delete_all
        FactoryBot.create(:recursoshumanos_vinculo_ativo)
        FactoryBot.create(:recursoshumanos_cargo)
      end

      it 'deve informar que tem 1 vagas' do
        expect(described_class.total_de_vagas).to be_eql(1)
      end

      it 'deve possuir um cargo com vaga disponivel' do
        expect(described_class.com_vagas_disponiveis.count).to be_eql(1)
      end
    end

    context 'duas ocupada' do
      before (:all) do
        Recursoshumanos::Vinculo.delete_all
        Recursoshumanos::Cargo.delete_all
        2.times { FactoryBot.create(:recursoshumanos_vinculo_ativo) }
      end

      it 'deve informar que nao tem vagas' do
        expect(described_class.total_de_vagas).to be_eql(0)
      end

      it 'nao deve possuir cargos com vaga disponivel' do
        expect(described_class.com_vagas_disponiveis).to be_empty
      end
    end
  end
end
