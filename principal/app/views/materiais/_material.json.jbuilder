# frozen_string_literal: true

json.extract! material, :id, :nome, :grupo_material_id, :unidades_medida_id, :created_at, :updated_at
json.url material_url(material, format: :json)
