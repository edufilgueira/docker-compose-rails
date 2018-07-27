# frozen_string_literal: true

json.extract! material_movimentacao, :id, :material_id, :unidades_socioeducativa_id, :quantidade_movimentada, :tipo_movimentacao, :created_at, :updated_at
json.url material_movimentacao_url(material_movimentacao, format: :json)
