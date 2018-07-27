# frozen_string_literal: true

class RemoveDescricaoResumidaToPatrimonio < ActiveRecord::Migration[5.1]
  def change
    remove_column :patrimonios, :descricao_resumida
  end
end
