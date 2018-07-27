# frozen_string_literal: true

json.extract! socioeduk_tipo_desligamento, :id, :descricao, :created_at, :updated_at
json.url socioeduk_tipo_desligamento_url(socioeduk_tipo_desligamento, format: :json)
