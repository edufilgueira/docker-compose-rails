# frozen_string_literal: true

class CreateSocioedukContatos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_contatos do |t|
      t.references :jovem, foreign_key: { to_table: :socioeduk_jovens }
      t.references :tipo_contato, foreign_key: { to_table: :socioeduk_tipo_contatos }
      t.integer :ddd
      t.string :numero

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
