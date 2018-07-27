# frozen_string_literal: true

json.extract! capacidade_diaria, :id, :unidade_socioeducativa_id, :capacidade, :data_referencia, :usuario_id, :created_at, :updated_at
json.url capacidade_diaria_url(capacidade_diaria, format: :json)
