# frozen_string_literal: true

json.extract! gestor_eixo, :id, :eixo_id, :pessoa_id, :data_inicio, :data_termino, :ativo, :created_at, :updated_at
json.url gestor_eixo_url(gestor_eixo, format: :json)
