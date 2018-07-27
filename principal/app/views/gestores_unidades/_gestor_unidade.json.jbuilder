# frozen_string_literal: true

json.extract! gestor_unidade, :id, :unidade_socioeducativa_id, :pessoa_id, :data_inicio, :data_termino, :ativo, :created_at, :updated_at
json.url gestor_unidade_url(gestor_unidade, format: :json)
