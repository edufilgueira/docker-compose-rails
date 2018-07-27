# frozen_string_literal: true

json.extract! classe_material, :id, :nome, :created_at, :updated_at
json.url classe_material_url(classe_material, format: :json)
