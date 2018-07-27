# frozen_string_literal: true

json.extract! tipo_solicitacao_transporte, :id, :tipo, :created_at, :updated_at
json.url tipo_solicitacao_transporte_url(tipo_solicitacao_transporte, format: :json)
