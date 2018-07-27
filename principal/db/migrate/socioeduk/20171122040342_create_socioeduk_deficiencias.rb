# frozen_string_literal: true

class CreateSocioedukDeficiencias < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_deficiencias do |t|
      t.references :jovem, foreign_key: { to_table: :socioeduk_jovens }
      t.references :deficiencias, foreign_key: { to_table: :socioeduk_deficiencias }

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
