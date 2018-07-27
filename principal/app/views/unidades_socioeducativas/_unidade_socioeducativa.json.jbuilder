# frozen_string_literal: true

json.extract! unidade_socioeducativa, :id, :nome, :sigla, :endereco, :created_at, :updated_at
json.url unidade_socioeducativa_url(unidade_socioeducativa, format: :json)
