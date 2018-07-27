# frozen_string_literal: true

json.extract! socioeduk_subforma_entrada, :id, :descricao, :forma_entrada_id, :created_at, :updated_at
json.url socioeduk_subforma_entrada_url(socioeduk_subforma_entrada, format: :json)
