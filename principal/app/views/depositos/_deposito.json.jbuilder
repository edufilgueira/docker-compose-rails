# frozen_string_literal: true

json.extract! deposito, :id, :nome, :created_at, :updated_at
json.url deposito_url(deposito, format: :json)
