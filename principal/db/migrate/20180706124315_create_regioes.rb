class CreateRegioes < ActiveRecord::Migration[5.1]
  def change
    create_table :regioes do |t|
      t.string :nome

      t.timestamps
    end
  end
end
