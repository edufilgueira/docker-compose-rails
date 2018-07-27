# frozen_string_literal: true

class CreateSocioedukEnderecos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_enderecos do |t|
      t.string :cep
      t.string :logradouro
      t.string :numero
      t.string :bairro
      t.string :complemento
      t.string :cidade
      t.string :estado
      t.string :ponto_referencia
      t.integer :tipo

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
