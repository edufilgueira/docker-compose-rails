
# frozen_string_literal: true

FactoryBot.define do
  factory :andamento do
    association :usuario, factory: :valid_user
    association :destinatario, factory: :area
    association :carga, factory: :material # Por ser polimorfico podemos aceitar qualquer classe , por não haver nenhuma que utilize ainda irei usar a material ...
  end
end
