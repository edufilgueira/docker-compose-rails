# frozen_string_literal: true

class Servico < ApplicationRecord
  audited
  acts_as_paranoid
  belongs_to :eixo
  validates_presence_of :nome, :eixo_id
end
