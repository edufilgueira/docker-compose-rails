# frozen_string_literal: true

FactoryBot.define do
  factory :material do
    nome 'MyString'
    classe_material
    unidades_medida
    local_armazenamento
    descricao 'foobar'
  end
end
