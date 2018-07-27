# frozen_string_literal: true

class CreateRecursoshumanosTipoVinculos < ActiveRecord::Migration[5.1]
  def change
    create_table :recursoshumanos_tipo_vinculos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
