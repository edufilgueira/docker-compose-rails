# frozen_string_literal: true

class Socioeduk::Contato < ApplicationRecord
  audited
  belongs_to :jovem
  belongs_to :tipo_contato
  validates_presence_of :ddd, :numero
end
