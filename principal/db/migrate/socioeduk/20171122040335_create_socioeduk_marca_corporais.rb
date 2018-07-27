# frozen_string_literal: true

class CreateSocioedukMarcaCorporais < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_marca_corporais do |t|
      t.references :jovem, foreign_key: { to_table: :socioeduk_jovens }
      t.references :marca_corporal, foreign_key: { to_table: :socioeduk_marca_corporais }

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
