# frozen_string_literal: true

FactoryBot.define do
  factory :recursoshumanos_cargo, class: 'Recursoshumanos::Cargo' do
    nome 'MyString'
    quantidade 1
    association :contrato, factory: :recursoshumanos_contrato
  end
end
