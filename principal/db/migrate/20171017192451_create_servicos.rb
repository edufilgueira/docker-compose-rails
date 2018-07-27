# frozen_string_literal: true

class CreateServicos < ActiveRecord::Migration[5.1]
  def change
    create_table :servicos do |t|
      t.references :eixo, foreign_key: true
      t.string :nome

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
