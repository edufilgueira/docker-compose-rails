# frozen_string_literal: true

class StatusPatrimonio < ApplicationRecord
  validates :nome, :descricao, presence: true
end
