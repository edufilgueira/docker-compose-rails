# frozen_string_literal: true

json.extract! posto_combustivel, :id, :nome, :cnpj, :rua, :numero, :bairro, :created_at, :updated_at
json.url posto_combustivel_url(posto_combustivel, format: :json)
