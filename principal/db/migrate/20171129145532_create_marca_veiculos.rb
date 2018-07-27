# frozen_string_literal: true

class CreateMarcaVeiculos < ActiveRecord::Migration[5.1]
  def change
    create_table :marca_veiculos do |t|
      t.string :marca

      t.timestamps
    end
  end
end
