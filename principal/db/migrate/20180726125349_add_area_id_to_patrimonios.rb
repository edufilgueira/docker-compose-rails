class AddAreaIdToPatrimonios < ActiveRecord::Migration[5.1]
  def change
    add_reference :patrimonios, :area, foreign_key: true
  end
end
