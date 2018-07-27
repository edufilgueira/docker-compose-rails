# frozen_string_literal: true

class CreateMapaDeBordos < ActiveRecord::Migration[5.1]
  def change
    create_table :mapa_de_bordos do |t|
      t.references :veiculo, foreign_key: true
      t.integer :tipo_vistoria
      t.date :data_vistoria
      t.references :responsavel, foreign_key: { to_table: :pessoas }
      t.references :motorista, foreign_key: { to_table: :pessoas }
      t.float :km_inicial
      t.date :hora_inicial
      t.float :km_final
      t.date :hora_final
      t.text :percurso
      t.text :parecer

      t.timestamps
    end
  end
end
