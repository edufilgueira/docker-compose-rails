# frozen_string_literal: true

FactoryBot.define do
  factory :permissao, class: Permissao do
    perfil 'Admin'
    recursos ['administrator|system']
  end

  factory :permissao_nao_admin, class: Permissao do
    perfil 'Fulano'
    recursos ['cicrano']
  end
end
