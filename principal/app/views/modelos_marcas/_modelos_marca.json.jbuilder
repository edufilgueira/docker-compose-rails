# frozen_string_literal: true

json.extract! modelos_marca, :id, :modelo, :marca_veiculo_id, :created_at, :updated_at
json.url modelos_marca_url(modelos_marca, format: :json)
