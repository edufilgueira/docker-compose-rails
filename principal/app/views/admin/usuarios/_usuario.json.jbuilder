# frozen_string_literal: true

json.extract! usuario, :id, :created_at, :updated_at
json.url admin_usuarios_url(usuario, format: :json)
