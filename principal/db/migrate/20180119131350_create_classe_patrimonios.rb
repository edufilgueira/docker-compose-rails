# frozen_string_literal: true

class CreateClassePatrimonios < ActiveRecord::Migration[5.1]
  def change
    create_table :classe_patrimonios do |t|
      t.references :grupo_patrimonio, foreign_key: true
      t.string :codigo
      t.string :nome

      t.timestamps
    end
  end
end
