# frozen_string_literal: true

class CreateVeiculos < ActiveRecord::Migration[5.1]
  def change
    create_table :veiculos do |t|
      t.string :placa
      t.decimal :km
      t.references :modelos_marca, foreign_key: true
      t.references :tipo_de_combustivel, foreign_key: true

      t.timestamps
    end
  end
end
