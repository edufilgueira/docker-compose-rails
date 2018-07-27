# frozen_string_literal: true

class Socioeduk::TipoInfracao < ApplicationRecord
  audited
  validates_presence_of :artigo, :nome, :descricao
end
