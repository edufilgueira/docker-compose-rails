# frozen_string_literal: true

json.extract! recursoshumanos_vinculo, :id, :data_inicio, :data_fim, :recursoshumanos_cargo_id, :pessoas_id, :created_at, :updated_at
json.url recursoshumanos_vinculo_url(recursoshumanos_vinculo, format: :json)
