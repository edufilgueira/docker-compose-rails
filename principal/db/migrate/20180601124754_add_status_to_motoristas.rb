class AddStatusToMotoristas < ActiveRecord::Migration[5.1]
  def change
    add_column :motoristas, :status, :string
  end
end
