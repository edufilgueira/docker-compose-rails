# frozen_string_literal: true

class CreateSocioedukSubformaEntradas < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_subforma_entradas do |t|
      t.string :descricao
      t.references :forma_entrada, foreign_key: { to_table: :socioeduk_forma_entradas }

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
