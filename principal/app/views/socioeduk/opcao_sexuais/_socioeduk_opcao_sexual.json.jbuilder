# frozen_string_literal: true

json.extract! socioeduk_opcao_sexual, :id, :descricao, :created_at, :updated_at
json.url socioeduk_opcao_sexual_url(socioeduk_opcao_sexual, format: :json)
