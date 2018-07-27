# frozen_string_literal: true

FactoryBot.define do
  factory :valid_user, class: Usuario do
    permissao
    pass = Faker::Crypto.md5
    id { Faker::Number.between(1, 1000) }
    nome { Faker::Lorem.sentence }
    email { Faker::Internet.email }
    password pass
    password_confirmation pass
    association :pessoa, factory: :pessoa_motorista
  end

  factory :invalid_user, class: Usuario do
    permissao
    pass = Faker::Crypto.md5
    id { Faker::Number.between(1, 1000) }
    nome nil
    email nil
    password pass
    password_confirmation pass
    association :pessoa, factory: :pessoa_motorista
  end

  factory :valid_user_admin, class: Usuario do
    permissao
    pass = Faker::Crypto.md5
    id { Faker::Number.between(1, 1000) }
    nome { Faker::Lorem.sentence }
    email { Faker::Internet.email }
    association :pessoa, factory: :pessoa_motorista
    password pass
    password_confirmation pass
  end

  factory :valid_user_no_admin, class: Usuario do
    permissao
    pass = Faker::Crypto.md5
    id { Faker::Number.between(1, 1000) }
    nome { Faker::Lorem.sentence }
    email { Faker::Internet.email }
    association :pessoa, factory: :pessoa_motorista
    password pass
    password_confirmation pass
  end
end
