# frozen_string_literal: true

json.extract! recursoshumanos_cargo, :id, :nome, :quantidade, :recursoshumanos_contratos_id, :created_at, :updated_at
json.url recursoshumanos_cargo_url(recursoshumanos_cargo, format: :json)
