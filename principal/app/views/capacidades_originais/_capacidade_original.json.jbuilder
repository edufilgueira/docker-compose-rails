# frozen_string_literal: true

json.extract! capacidade_original, :id, :unidade_socioeducativa_id, :capacidade, :data_referencia, :usuario_id, :created_at, :updated_at
json.url capacidade_original_url(capacidade_original, format: :json)
