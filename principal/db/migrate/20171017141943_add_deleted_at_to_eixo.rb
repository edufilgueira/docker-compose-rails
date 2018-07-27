# frozen_string_literal: true

class AddDeletedAtToEixo < ActiveRecord::Migration[5.1]
  def change
    add_column :eixos, :deleted_at, :datetime
  end
end
