class CreateSocioedukCorOlhos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_cor_olhos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
