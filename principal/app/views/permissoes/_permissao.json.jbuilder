# frozen_string_literal: true

json.extract! permissao, :id, :perfil, :recursos, :created_at, :updated_at
json.url permissao_url(permissao, format: :json)
