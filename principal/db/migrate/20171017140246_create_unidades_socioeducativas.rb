# frozen_string_literal: true

class CreateUnidadesSocioeducativas < ActiveRecord::Migration[5.1]
  def change
    create_table :unidades_socioeducativas do |t|
      t.string :nome
      t.string :sigla
      t.string :endereco

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
