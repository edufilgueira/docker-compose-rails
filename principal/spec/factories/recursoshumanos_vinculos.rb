# frozen_string_literal: true

FactoryBot.define do
  factory :recursoshumanos_vinculo, class: 'Recursoshumanos::Vinculo' do
    data_inicio '2018-02-01'
    data_fim '2018-02-01'
    association :recursoshumanos_cargo, factory: :recursoshumanos_cargo
    association :pessoas, factory: :pessoa
  end

  factory :recursoshumanos_vinculo_ativo, class: 'Recursoshumanos::Vinculo' do
    data_inicio '2018-02-01'
    data_fim nil
    association :recursoshumanos_cargo, factory: :recursoshumanos_cargo
    association :pessoas, factory: :pessoa
  end
end
