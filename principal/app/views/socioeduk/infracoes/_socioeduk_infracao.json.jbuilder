# frozen_string_literal: true

json.extract! socioeduk_infracao, :id, :jovem_id, :tipo_infracao_id, :created_at, :updated_at
json.url socioeduk_infracao_url(socioeduk_infracao, format: :json)
