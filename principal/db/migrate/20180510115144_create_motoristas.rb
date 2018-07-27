class CreateMotoristas < ActiveRecord::Migration[5.1]
  def change
    create_table :motoristas do |t|
      t.string :nome
      t.string :numero
      t.string :registro
      t.date :validade
      t.string :categoria
      t.text :obs

      t.timestamps
    end
  end
end
