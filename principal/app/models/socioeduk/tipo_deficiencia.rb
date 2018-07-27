# frozen_string_literal: true

class Socioeduk::TipoDeficiencia < ApplicationRecord
  audited
  validates_presence_of :descricao
end
