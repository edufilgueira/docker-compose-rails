class AddStatusToMapaDeBordos < ActiveRecord::Migration[5.1]
  def change
    add_column :mapa_de_bordos, :status, :string
  end
end
