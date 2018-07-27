class AddSubareaIdToPatrimonio < ActiveRecord::Migration[5.1]
  def change
    add_column :patrimonios, :subarea_id, :integer
  end
end
