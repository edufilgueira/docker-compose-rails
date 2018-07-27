# frozen_string_literal: true

class CreateLocalArmazenamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :local_armazenamentos do |t|
      t.string :descricao_local
      t.references :unidade_socioeducativa, foreign_key: true

      t.timestamps
    end
  end
end
