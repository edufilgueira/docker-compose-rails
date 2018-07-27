# frozen_string_literal: true

class AddColumnNomeToStatusPatrimonio < ActiveRecord::Migration[5.1]
  def change
    add_column :status_patrimonios, :nome, :string
  end
end
