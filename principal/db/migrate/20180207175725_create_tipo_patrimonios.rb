# frozen_string_literal: true

class CreateTipoPatrimonios < ActiveRecord::Migration[5.1]
  def change
    create_table :tipo_patrimonios do |t|
      t.string :nome

      t.timestamps
    end
  end
end
