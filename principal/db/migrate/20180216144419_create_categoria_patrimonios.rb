# frozen_string_literal: true

class CreateCategoriaPatrimonios < ActiveRecord::Migration[5.1]
  def change
    create_table :categoria_patrimonios do |t|
      t.string :nome

      t.timestamps
    end
  end
end
