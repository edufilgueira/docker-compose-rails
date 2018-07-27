# frozen_string_literal: true

json.extract! solicitacao_transporte, :id, :tipo_solicitacao_transporte_id, :area_id, :destinado_para, :data_transporte, :data_retorno, :hora_solicitada, :hora_prevista_retorno, :destino, :justificativa, :urgente, :justificativa_urgencia, :created_at, :updated_at
json.url solicitacao_transporte_url(solicitacao_transporte, format: :json)
