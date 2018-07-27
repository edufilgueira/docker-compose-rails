# frozen_string_literal: true

json.extract! coleta_indicador, :id, :indicador_id, :abrangencia_coleta, :area_id, :pessoa_id, :indice, :semestre, :quadrimestre, :trimestre, :mes, :quinzena, :semana, :ano, :periodo_coleta, :created_at, :updated_at
json.url coleta_indicador_url(coleta_indicador, format: :json)
