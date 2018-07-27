# frozen_string_literal: true

class Socioeduk::Documento < ApplicationRecord
  audited
  belongs_to :jovem
  validates_presence_of :cpf
  validates_uniqueness_of :cpf
end
