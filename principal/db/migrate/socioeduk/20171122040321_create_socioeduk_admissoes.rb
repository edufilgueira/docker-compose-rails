# frozen_string_literal: true

class CreateSocioedukAdmissoes < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_admissoes do |t|
      t.references :jovem, foreign_key: { to_table: :socioeduk_jovens }
      t.references :unidade_socioeducativa, foreign_key: true
      t.datetime :rebebido_em
      t.integer :tipo_desligamento_id
      t.datetime :desligado_em
      t.string :numero_processo

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
