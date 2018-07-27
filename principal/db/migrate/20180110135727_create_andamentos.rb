# frozen_string_literal: true

class CreateAndamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :andamentos do |t|
      t.references :usuario, foreign_key: true
      t.references :destinatario, foreign_key: { to_table: :areas }

      t.timestamps
    end
  end
end
