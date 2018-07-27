# frozen_string_literal: true

FactoryBot.define do
  factory :veiculo do
    placa 'Placa'
    km 9.99
    modelos_marca
    tipo_de_combustivel
  end
end
