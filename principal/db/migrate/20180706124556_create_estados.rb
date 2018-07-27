class CreateEstados < ActiveRecord::Migration[5.1]
  def change
    create_table :estados do |t|
      t.string :nome
      t.string :acronym
      t.references :regiao, foreign_key: true

      t.timestamps
    end
  end
end
