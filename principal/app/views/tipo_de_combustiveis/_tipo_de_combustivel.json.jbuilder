# frozen_string_literal: true

json.extract! tipo_de_combustivel, :id, :nome, :created_at, :updated_at
json.url tipo_de_combustivel_url(tipo_de_combustivel, format: :json)
