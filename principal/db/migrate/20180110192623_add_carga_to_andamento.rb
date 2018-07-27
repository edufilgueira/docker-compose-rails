# frozen_string_literal: true

class AddCargaToAndamento < ActiveRecord::Migration[5.1]
  def change
    add_reference :andamentos, :carga, polymorphic: true, index: true
  end
end
