# frozen_string_literal: true

json.extract! socioeduk_atendimento_inicial_documento, :id, :descricao, :atendimento_inicial_id, :documento_forma_entrada_id, :documento, :created_at, :updated_at
json.url socioeduk_atendimento_inicial_documento_url(socioeduk_atendimento_inicial_documento, format: :json)
