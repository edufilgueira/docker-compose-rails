# frozen_string_literal: true

class Socioeduk::TipoContato < ApplicationRecord
  audited
  validates_presence_of :descricao
end
