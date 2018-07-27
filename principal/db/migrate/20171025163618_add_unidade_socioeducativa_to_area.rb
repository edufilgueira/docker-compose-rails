# frozen_string_literal: true

class AddUnidadeSocioeducativaToArea < ActiveRecord::Migration[5.1]
  def change
    add_reference :areas, :unidade_socioeducativa, foreign_key: true
  end
end
