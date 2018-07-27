# frozen_string_literal: true

json.extract! recursoshumanos_tipo_vinculo, :id, :nome, :created_at, :updated_at
json.url recursoshumanos_tipo_vinculo_url(recursoshumanos_tipo_vinculo, format: :json)
