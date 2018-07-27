# frozen_string_literal: true

class Eixo < ApplicationRecord
  audited
  acts_as_paranoid
  validates_presence_of :nome
end
