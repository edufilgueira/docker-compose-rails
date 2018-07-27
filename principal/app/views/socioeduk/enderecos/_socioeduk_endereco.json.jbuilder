# frozen_string_literal: true

json.extract! socioeduk_endereco, :id, :cep, :logradouro, :numero, :bairro, :complemento, :cidade, :estado, :ponto_referencia, :tipo, :created_at, :updated_at
json.url socioeduk_endereco_url(socioeduk_endereco, format: :json)
