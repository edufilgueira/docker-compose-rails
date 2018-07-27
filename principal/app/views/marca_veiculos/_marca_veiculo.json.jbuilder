# frozen_string_literal: true

json.extract! marca_veiculo, :id, :marca, :created_at, :updated_at
json.url marca_veiculo_url(marca_veiculo, format: :json)
