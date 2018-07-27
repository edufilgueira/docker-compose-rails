# frozen_string_literal: true

class CreateStatusPatrimonios < ActiveRecord::Migration[5.1]
  def change
    create_table :status_patrimonios do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
