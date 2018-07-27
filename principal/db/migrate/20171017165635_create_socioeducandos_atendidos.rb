# frozen_string_literal: true

class CreateSocioeducandosAtendidos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeducandos_atendidos do |t|
      t.integer :ano, limit: 4
      t.integer :mes, limit: 2
      t.references :unidade_socioeducativa, foreign_key: true
      t.integer :quantidade

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
