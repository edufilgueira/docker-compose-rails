# frozen_string_literal: true

class CreateSocioedukInfracaoPreliminares < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_infracao_preliminares do |t|
      t.references :atendimento_inicial, foreign_key: { to_table: :socioeduk_atendimento_iniciais }
      t.references :tipo_infracao, foreign_key: { to_table: :socioeduk_tipo_infracoes }

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
