# frozen_string_literal: true

class CreateMateriais < ActiveRecord::Migration[5.1]
  def change
    create_table :materiais do |t|
      t.string :nome
      t.references :grupo_material, foreign_key: true
      t.references :unidades_medida, foreign_key: true

      t.timestamps
    end
  end
end
