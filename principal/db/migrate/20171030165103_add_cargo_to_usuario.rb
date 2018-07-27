# frozen_string_literal: true

class AddCargoToUsuario < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :cargo, :string
    remove_column :usuarios, :admin
  end
end
