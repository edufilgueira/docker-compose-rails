# frozen_string_literal: true

class CreateSocioedukTipoInfracoes < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_tipo_infracoes do |t|
      t.string :artigo
      t.string :nome
      t.string :descricao

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
