# frozen_string_literal: true

json.extract! funcao_pessoa, :id, :funcao_id, :pessoa_id, :created_at, :updated_at
json.url funcao_pessoa_url(funcao_pessoa, format: :json)
