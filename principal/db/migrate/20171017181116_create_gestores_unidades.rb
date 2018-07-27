# frozen_string_literal: true

class CreateGestoresUnidades < ActiveRecord::Migration[5.1]
  def change
    create_table :gestores_unidades do |t|
      t.references :unidade_socioeducativa, foreign_key: true
      t.references :pessoa, foreign_key: true
      t.date :data_inicio
      t.date :data_termino
      t.boolean :ativo, default: false

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
