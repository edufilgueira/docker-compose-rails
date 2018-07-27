# frozen_string_literal: true

class CreateSocioedukAdmissaoAnexos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_admissao_anexos do |t|
      t.references :jovem, foreign_key: { to_table: :socioeduk_jovens }
      t.attachment :kit
      t.attachment :documentos

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
