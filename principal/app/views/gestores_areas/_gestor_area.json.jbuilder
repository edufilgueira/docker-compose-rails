# frozen_string_literal: true

json.extract! gestor_area, :id, :area_id, :pessoa_id, :data_inicio, :data_termino, :ativo, :created_at, :updated_at
json.url gestor_area_url(gestor_area, format: :json)
