# frozen_string_literal: true

class CreateSocioedukTipoContatos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_tipo_contatos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
