# frozen_string_literal: true

json.extract! grupo_material, :id, :nome, :created_at, :updated_at
json.url grupo_material_url(grupo_material, format: :json)
