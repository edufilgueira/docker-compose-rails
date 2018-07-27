# frozen_string_literal: true

json.extract! socioeduk_infracao_preliminar, :id, :atendimento_inicial_id, :tipo_infracao_id, :created_at, :updated_at
json.url socioeduk_infracao_preliminar_url(socioeduk_infracao_preliminar, format: :json)
