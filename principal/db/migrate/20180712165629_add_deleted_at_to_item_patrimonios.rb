class AddDeletedAtToItemPatrimonios < ActiveRecord::Migration[5.1]
  def change
    add_column :item_patrimonios, :deleted_at, :datetime
    add_index :item_patrimonios, :deleted_at
  end
end
