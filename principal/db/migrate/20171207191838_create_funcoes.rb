# frozen_string_literal: true

class CreateFuncoes < ActiveRecord::Migration[5.1]
  def change
    create_table :funcoes do |t|
      t.string :nome

      t.timestamps
    end
  end
end
