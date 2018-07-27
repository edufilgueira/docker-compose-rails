class CreateSocioedukJovemCaracteristicas < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_jovem_caracteristicas do |t|
      t.references :socioeduk_jovem, foreign_key: true, index: {:name => "jovem"}
      t.references :socioeduk_tipo_sinal, foreign_key: true, index: {:name => "tipo_sinal"}
      t.string :local_sinal
      t.string :descricao

      t.timestamps
    end
  end
end
