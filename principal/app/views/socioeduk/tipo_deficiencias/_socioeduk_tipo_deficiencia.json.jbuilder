# frozen_string_literal: true

json.extract! socioeduk_tipo_deficiencia, :id, :descricao, :created_at, :updated_at
json.url socioeduk_tipo_deficiencia_url(socioeduk_tipo_deficiencia, format: :json)
