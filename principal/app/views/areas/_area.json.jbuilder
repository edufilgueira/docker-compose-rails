# frozen_string_literal: true

json.extract! area, :id, :nome, :subarea_id, :created_at, :updated_at
json.url area_url(area, format: :json)
