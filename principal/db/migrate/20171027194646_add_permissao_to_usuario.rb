# frozen_string_literal: true

class AddPermissaoToUsuario < ActiveRecord::Migration[5.1]
  def change
    add_reference :usuarios, :permissao, foreign_key: true
  end
end
