# frozen_string_literal: true

class CreateSocioedukFormaEntradas < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_forma_entradas do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
