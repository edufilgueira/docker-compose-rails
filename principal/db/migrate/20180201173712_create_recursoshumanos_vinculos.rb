# frozen_string_literal: true

class CreateRecursoshumanosVinculos < ActiveRecord::Migration[5.1]
  def change
    create_table :recursoshumanos_vinculos do |t|
      t.date :data_inicio
      t.date :data_fim
      t.references :recursoshumanos_cargo, foreign_key: true
      t.references :pessoas, foreign_key: true

      t.timestamps
    end
  end
end
