# frozen_string_literal: true

class CreateClasseMateriais < ActiveRecord::Migration[5.1]
  def change
    create_table :classe_materiais do |t|
      t.string :nome

      t.timestamps
    end
  end
end
