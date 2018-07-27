class AddDeletedAtToPatrimonios < ActiveRecord::Migration[5.1]
  def change
    add_column :patrimonios, :deleted_at, :datetime
    add_index :patrimonios, :deleted_at
  end
end
