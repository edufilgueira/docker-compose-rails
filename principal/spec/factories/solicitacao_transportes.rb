# frozen_string_literal: true

FactoryBot.define do
  factory :solicitacao_transporte do
    tipo_solicitacao_transporte
    area
    association :destinado_para, factory: :pessoa
    data_transporte '2018-01-22'
    data_retorno '2018-01-22'
    hora_solicitada '2018-01-22 11:18:02'
    hora_prevista_retorno '2018-01-22 11:18:02'
    destino 'MyString'
    justificativa 'MyString'
    urgente false
    justificativa_urgencia 'MyString'
  end
end
