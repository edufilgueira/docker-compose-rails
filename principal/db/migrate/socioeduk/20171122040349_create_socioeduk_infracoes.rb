# frozen_string_literal: true

class CreateSocioedukInfracoes < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_infracoes do |t|
      t.references :jovem, foreign_key: { to_table: :socioeduk_jovens }
      t.references :tipo_infracao, foreign_key: { to_table: :socioeduk_tipo_infracoes }

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
