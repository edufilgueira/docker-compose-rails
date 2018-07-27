# frozen_string_literal: true

class Socioeduk::DocumentoFormaEntrada < ApplicationRecord
  belongs_to :forma_entrada
  belongs_to :subforma_entrada
end
