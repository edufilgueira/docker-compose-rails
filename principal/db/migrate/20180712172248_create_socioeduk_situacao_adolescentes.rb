class CreateSocioedukSituacaoAdolescentes < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_situacao_adolescentes do |t|
      t.string :descricao
      t.boolean :remocao_fila

      t.timestamps
    end
  end
end
