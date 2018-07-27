# frozen_string_literal: true

class CreateSocioedukTransferencias < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_transferencias do |t|
      t.integer :unidade_socioeducativa_origem_id
      t.integer :unidade_socioeducativa_destino_id
      t.references :admissao, foreign_key: { to_table: :socioeduk_admissoes }

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
