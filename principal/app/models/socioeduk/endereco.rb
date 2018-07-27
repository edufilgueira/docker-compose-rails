# frozen_string_literal: true

class Socioeduk::Endereco < ApplicationRecord
  audited
  belongs_to :tipo_contato
  belongs_to :jovem
  validates_presence_of :cep, :logradouro, :cidade
end
