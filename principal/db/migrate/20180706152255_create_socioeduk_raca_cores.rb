class CreateSocioedukRacaCores < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_raca_cores do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
