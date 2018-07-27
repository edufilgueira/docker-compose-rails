# frozen_string_literal: true

FactoryBot.define do
  factory :recursoshumanos_contrato, class: 'Recursoshumanos::Contrato' do
    association :recursoshumanos_tipo_legal, factory: :recursoshumanos_tipo_legal
    inicio 'MyString'
    numero 1
    ano 2
    doe_ce 'Doe Ce'
    data_doe_ce '2018-01-17'
    pagina_doe_ce 3
    inicio_vigencia '2018-01-17'
    final_vigencia '2018-01-17'
  end
end
