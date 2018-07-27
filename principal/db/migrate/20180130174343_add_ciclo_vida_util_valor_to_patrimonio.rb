# frozen_string_literal: true

class AddCicloVidaUtilValorToPatrimonio < ActiveRecord::Migration[5.1]
  def change
    add_column :patrimonios, :ciclo_vida_util, :string
    add_column :patrimonios, :valor, :decimal
  end
end
