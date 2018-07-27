# frozen_string_literal: true

FactoryBot.define do
  factory :recursoshumanos_tipo_legal, class: 'Recursoshumanos::TipoLegal' do
    nome 'MyString'

    association :recursoshumanos_tipo_vinculo, factory: :recursoshumanos_tipo_vinculo
  end
end
