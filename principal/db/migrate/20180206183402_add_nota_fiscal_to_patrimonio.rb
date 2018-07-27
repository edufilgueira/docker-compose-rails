# frozen_string_literal: true

class AddNotaFiscalToPatrimonio < ActiveRecord::Migration[5.1]
  def change
    add_column :patrimonios, :nota_fiscal, :string
  end
end
