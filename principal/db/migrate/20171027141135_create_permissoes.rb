# frozen_string_literal: true

class CreatePermissoes < ActiveRecord::Migration[5.1]
  def change
    create_table :permissoes do |t|
      t.string :perfil
      t.text :recursos, array: true, default: []

      t.timestamps
    end
  end
end
