# frozen_string_literal: true

class CreateSocioedukTipoMarcaCorporais < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_tipo_marca_corporais do |t|
      t.string :descricao

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
