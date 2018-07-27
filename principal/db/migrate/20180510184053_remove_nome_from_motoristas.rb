class RemoveNomeFromMotoristas < ActiveRecord::Migration[5.1]
  def change
    remove_column :motoristas, :nome, :string
  end
end
