# frozen_string_literal: true

class CreateSocioedukDecisaoJudiciais < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_decisao_judiciais do |t|
      t.string :descricao
      t.references :atendimento_inicial, foreign_key: { to_table: :socioeduk_atendimento_iniciais }
      t.attachment :documento

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
