# frozen_string_literal: true

FactoryBot.define do
  factory :funcao do
    area
    nome 'NomeDaFuncao'
  end

  factory :funcao_motorista, class: Funcao do
    nome 'Motorista'
    area
  end
end
