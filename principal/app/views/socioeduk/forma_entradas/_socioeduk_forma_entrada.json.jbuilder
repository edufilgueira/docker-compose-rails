# frozen_string_literal: true

json.extract! socioeduk_forma_entrada, :id, :descricao, :created_at, :updated_at
json.url socioeduk_forma_entrada_url(socioeduk_forma_entrada, format: :json)
