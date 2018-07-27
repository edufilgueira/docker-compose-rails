# frozen_string_literal: true

json.extract! socioeduk_documento_forma_entrada, :id, :descricao, :obrigatorio, :forma_entrada_id, :subforma_entrada_id, :created_at, :updated_at
json.url socioeduk_documento_forma_entrada_url(socioeduk_documento_forma_entrada, format: :json)
