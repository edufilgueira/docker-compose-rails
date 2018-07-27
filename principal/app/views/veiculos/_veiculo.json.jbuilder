# frozen_string_literal: true

json.extract! veiculo, :id, :placa, :km, :modelos_marca_id, :tipo_de_combustivel_id, :created_at, :updated_at
json.url veiculo_url(veiculo, format: :json)
