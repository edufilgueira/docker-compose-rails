# frozen_string_literal: true

class GenerateAuthTokenOnEveryUser < ActiveRecord::Migration[5.1]
  def change
    Usuario.all.map(&:save)
  end
end
