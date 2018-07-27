# -*- coding: utf-8 -*-
# frozen_string_literal: true

FactoryBot.define do
  factory :mapa_de_bordo do
    veiculo
    tipo_vistoria 'Diária'
    data_vistoria '2018-03-26'
    association :responsavel, factory: :pessoa
    association :motorista, factory: :pessoa_motorista
    km_inicial 3.5
    hora_inicial '2018-03-26'
    km_final 4.5
    hora_final '2018-03-26'
    percurso 'MyText'
    parecer 'MyText'
  end
end
