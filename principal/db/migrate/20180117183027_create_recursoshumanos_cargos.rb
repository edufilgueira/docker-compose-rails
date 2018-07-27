# frozen_string_literal: true

class CreateRecursoshumanosCargos < ActiveRecord::Migration[5.1]
  def change
    create_table :recursoshumanos_cargos do |t|
      t.string :nome
      t.integer :quantidade
      t.references :recursoshumanos_contratos, foreign_key: true

      t.timestamps
    end
  end
end
