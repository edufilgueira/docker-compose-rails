# frozen_string_literal: true

FactoryBot.define do
  factory :patrimonio, class: Patrimonio do
    item_patrimonio
    status_patrimonio
    deposito
    tombo_anterior { Faker::Number.number(4) }
    origem_anterior { Faker::Name.name }
    tombo_atual { Faker::Number.number(4) }
    origem_atual { Faker::Name.name }
    valor { Faker::Number.decimal(3) }
    ciclo_vida_util { Faker::Name.suffix }
    nota_fiscal { Faker::Number.number(9) }
  end
end
