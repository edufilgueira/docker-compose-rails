# frozen_string_literal: true

json.extract! recursoshumanos_tipo_legal, :id, :nome, :created_at, :updated_at
json.url recursoshumanos_tipo_legal_url(recursoshumanos_tipo_legal, format: :json)
