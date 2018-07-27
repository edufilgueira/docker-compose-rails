class CreateSocioedukEnderecoJovens < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_endereco_jovens do |t|
      t.references :socioeduk_jovem, foreign_key: true
      t.references :cidade, foreign_key: true
      t.string :rua
      t.string :numero
      t.string :complemento
      t.string :bairro
      t.string :cep

      t.timestamps
    end
  end
end
