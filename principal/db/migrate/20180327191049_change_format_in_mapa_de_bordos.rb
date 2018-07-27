class ChangeFormatInMapaDeBordos < ActiveRecord::Migration[5.1]
  def change
    change_column :mapa_de_bordos, :hora_inicial, :datetime
    change_column :mapa_de_bordos, :hora_final, :datetime
  end
end
