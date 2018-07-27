# frozen_string_literal: true

class CreateGrupoPatrimonios < ActiveRecord::Migration[5.1]
  def change
    create_table :grupo_patrimonios do |t|
      t.string :codigo
      t.string :nome

      t.timestamps
    end
  end
end
