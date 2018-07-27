# frozen_string_literal: true

class CreateSocioedukEvasoes < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_evasoes do |t|
      t.references :jovem, foreign_key: { to_table: :socioeduk_jovens }
      t.datetime :data_evasao
      t.boolean :evadido
      t.datetime :retornou_em
      t.integer :tipo_evasao
      t.text :observacoes
      t.string :motivo

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
