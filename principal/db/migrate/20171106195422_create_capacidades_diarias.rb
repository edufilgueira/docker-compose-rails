# frozen_string_literal: true

class CreateCapacidadesDiarias < ActiveRecord::Migration[5.1]
  def change
    create_table :capacidades_diarias do |t|
      t.references :unidade_socioeducativa, foreign_key: true
      t.integer :capacidade
      t.date :data_referencia
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
