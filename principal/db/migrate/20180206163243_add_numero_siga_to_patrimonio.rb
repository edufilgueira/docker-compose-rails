# frozen_string_literal: true

class AddNumeroSigaToPatrimonio < ActiveRecord::Migration[5.1]
  def change
    add_column :patrimonios, :numero_siga, :integer
  end
end
