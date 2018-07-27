# frozen_string_literal: true

FactoryBot.define do
  factory :gestor_unidade do
    unidade_socioeducativa nil
    pessoa nil
    data_inicio '2017-10-17'
    data_termino '2017-10-17'
    ativo false
  end
end
