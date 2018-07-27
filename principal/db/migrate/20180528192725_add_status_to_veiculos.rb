class AddStatusToVeiculos < ActiveRecord::Migration[5.1]
  def change
    add_column :veiculos, :status, :string
  end
end
