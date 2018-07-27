# frozen_string_literal: true

class RemoveClassePatrimonioIdToPatrimoinio < ActiveRecord::Migration[5.1]
  def change
    remove_column :patrimonios, :classe_patrimonio_id
  end
end
