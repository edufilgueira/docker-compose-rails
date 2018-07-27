# frozen_string_literal: true

class LocalArmazenamento < ApplicationRecord
  belongs_to :unidade_socioeducativa, required: false
  has_many :materiais
end
