# frozen_string_literal: true

class CreateModelosMarcas < ActiveRecord::Migration[5.1]
  def change
    create_table :modelos_marcas do |t|
      t.string :modelo
      t.references :marca_veiculo, foreign_key: true

      t.timestamps
    end
  end
end
