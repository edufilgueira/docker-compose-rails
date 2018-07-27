# frozen_string_literal: true

class CreatePostoCombustiveis < ActiveRecord::Migration[5.1]
  def change
    create_table :posto_combustiveis do |t|
      t.string :nome
      t.string :cnpj
      t.string :rua
      t.string :numero
      t.string :bairro

      t.timestamps
    end
  end
end
