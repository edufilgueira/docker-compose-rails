# frozen_string_literal: true

FactoryBot.define do
  factory :local_armazenamento, class: LocalArmazenamento do
    descricao_local 'MyString'
    unidade_socioeducativa
  end
end
