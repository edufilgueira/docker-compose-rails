# frozen_string_literal: true

class CreateEixos < ActiveRecord::Migration[5.1]
  def change
    create_table :eixos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
