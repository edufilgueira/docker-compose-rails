class AddUnidadeSocioeducativaRefToPatrimonio < ActiveRecord::Migration[5.1]
  def change
    add_reference :patrimonios, :unidade_socioeducativa, foreign_key: true
  end
end
