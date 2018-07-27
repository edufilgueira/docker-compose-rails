# frozen_string_literal: true

class CreateAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :areas do |t|
      t.string :nome
      t.integer :subarea_id

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
