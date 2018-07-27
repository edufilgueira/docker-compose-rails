# frozen_string_literal: true

FactoryBot.define do
  factory :item_patrimonio do
    classe_patrimonio
    tipo_patrimonio
    nome 'Banco'
    descricao 'Banco Verde'
    codigo '4582'
  end
end
