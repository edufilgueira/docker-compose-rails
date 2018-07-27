# frozen_string_literal: true

class Socioeduk::OpcaoSexual < ApplicationRecord
  audited
  validates_presence_of :descricao
end
