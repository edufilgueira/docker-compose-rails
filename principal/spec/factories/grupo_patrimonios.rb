# frozen_string_literal: true

FactoryBot.define do
  factory :grupo_patrimonio, class: GrupoPatrimonio do
    codigo { Faker::Number.number(3) }
    nome { Faker::Name.name }
  end
end
