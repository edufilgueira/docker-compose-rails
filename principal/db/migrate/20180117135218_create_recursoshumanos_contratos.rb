# frozen_string_literal: true

class CreateRecursoshumanosContratos < ActiveRecord::Migration[5.1]
  def change
    create_table :recursoshumanos_contratos do |t|
      t.references :recursoshumanos_tipo_legal, foreign_key: true, index: { name: 'rec_hum_tip_legal' }
      t.references :recursoshumanos_tipo_vinculo, foreign_key: true, index: { name: 'rec_hum_vinc_legal' }
      t.string :inicio
      t.integer :numero
      t.integer :ano
      t.string :doe_ce
      t.date :data_doe_ce
      t.integer :pagina_doe_ce
      t.date :inicio_vigencia
      t.date :final_vigencia

      t.timestamps
    end
  end
end
