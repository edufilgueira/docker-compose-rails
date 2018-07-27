# frozen_string_literal: true

json.extract! socioeduk_decisao_judicial, :id, :descricao, :atendimento_inicial_id, :documento, :created_at, :updated_at
json.url socioeduk_decisao_judicial_url(socioeduk_decisao_judicial, format: :json)
