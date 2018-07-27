# frozen_string_literal: true

class CreateItemPatrimonios < ActiveRecord::Migration[5.1]
  def change
    create_table :item_patrimonios do |t|
      t.references :classe_patrimonio, foreign_key: true
      t.references :tipo_patrimonio, foreign_key: true
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end
end
