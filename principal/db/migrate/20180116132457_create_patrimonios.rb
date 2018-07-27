# frozen_string_literal: true

class CreatePatrimonios < ActiveRecord::Migration[5.1]
  def change
    create_table :patrimonios do |t|
      t.string :nome
      t.references :classe_material, foreign_key: true
      t.references :unidades_medida, foreign_key: true
      t.text :descricao
      t.string :descricao_resumida
      t.string :tombo_anterior
      t.string :origem_anterior
      t.string :tombo_atual
      t.string :origem_atual

      t.timestamps
    end
  end
end
