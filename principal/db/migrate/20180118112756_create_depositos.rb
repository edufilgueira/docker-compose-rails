# frozen_string_literal: true

class CreateDepositos < ActiveRecord::Migration[5.1]
  def change
    create_table :depositos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
