# frozen_string_literal: true

class RemoveNumeroSigaNomeDescricaoToPatrimonio < ActiveRecord::Migration[5.1]
  def change
    remove_column :patrimonios, :numero_siga
    remove_column :patrimonios, :nome
    remove_column :patrimonios, :descricao
  end
end
