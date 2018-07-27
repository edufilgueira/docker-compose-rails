# frozen_string_literal: true

class CreateIndicadorAssuntos < ActiveRecord::Migration[5.1]
  def change
    create_table :indicador_assuntos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
