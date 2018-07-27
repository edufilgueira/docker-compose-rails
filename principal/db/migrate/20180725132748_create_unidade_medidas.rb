class CreateUnidadeMedidas < ActiveRecord::Migration[5.1]
  def change
    create_table :unidade_medidas do |t|
      t.string :descricao
      t.boolean :ativo

      t.timestamps
    end
  end
end
