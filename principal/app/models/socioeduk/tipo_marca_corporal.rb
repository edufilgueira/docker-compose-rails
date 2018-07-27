# frozen_string_literal: true

class Socioeduk::TipoMarcaCorporal < ApplicationRecord
  audited
  validates_presence_of :descricao
end
