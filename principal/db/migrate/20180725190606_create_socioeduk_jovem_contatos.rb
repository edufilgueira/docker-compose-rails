class CreateSocioedukJovemContatos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_jovem_contatos do |t|
      t.references :socioeduk_jovem, foreign_key: true
      t.references :socioeduk_tipo_contato, foreign_key: true
      t.string :numero

      t.timestamps
    end
  end
end
