# frozen_string_literal: true

class AddSiglaToArea < ActiveRecord::Migration[5.1]
  def change
    add_column :areas, :sigla, :string, limit: 10
  end
end
