# frozen_string_literal: true

json.extract! socioeduk_tipo_infracao, :id, :artigo, :nome, :descricao, :created_at, :updated_at
json.url socioeduk_tipo_infracao_url(socioeduk_tipo_infracao, format: :json)
