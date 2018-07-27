class Socioeduk::JovemCaracteristica < ApplicationRecord
  belongs_to :jovem
  belongs_to :tipo_sinal
end
