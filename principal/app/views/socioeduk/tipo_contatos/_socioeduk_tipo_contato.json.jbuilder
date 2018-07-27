# frozen_string_literal: true

json.extract! socioeduk_tipo_contato, :id, :descricao, :created_at, :updated_at
json.url socioeduk_tipo_contato_url(socioeduk_tipo_contato, format: :json)
