# frozen_string_literal: true

class CreatePessoas < ActiveRecord::Migration[5.1]
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :matricula
      t.string :cpf

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
