# frozen_string_literal: true

FactoryBot.define do
  factory :servico_realizado do
    eixo nil
    gestor_eixo nil
    unidade_socioeducativa nil
    gestor_unidade nil
    area nil
    gestor_area nil
    socioeducando_atendido nil
    servico nil
    quantidade_realizados 1
  end
end
