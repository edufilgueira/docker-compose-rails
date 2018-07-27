# frozen_string_literal: true

FactoryBot.define do
  factory :material_movimentacao do
    material nil
    unidade_socieducativas nil
    quantidade_movimentada 1
    tipo_movimentacao 'MyString'
  end
end
