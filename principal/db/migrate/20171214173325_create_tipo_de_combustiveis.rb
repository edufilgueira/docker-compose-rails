# frozen_string_literal: true

class CreateTipoDeCombustiveis < ActiveRecord::Migration[5.1]
  def change
    create_table :tipo_de_combustiveis do |t|
      t.string :nome

      t.timestamps
    end
  end
end
