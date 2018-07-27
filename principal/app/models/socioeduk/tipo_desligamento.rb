# frozen_string_literal: true

class Socioeduk::TipoDesligamento < ApplicationRecord
  audited
  validates_presence_of :descricao
end
