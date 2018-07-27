# frozen_string_literal: true

class CreateFuncaoPessoas < ActiveRecord::Migration[5.1]
  def change
    create_table :funcao_pessoas do |t|
      t.references :funcao, foreign_key: true
      t.references :pessoa, foreign_key: true

      t.timestamps
    end
  end
end
