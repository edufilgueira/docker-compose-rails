# frozen_string_literal: true

class Socioeduk::Infracao < ApplicationRecord
  belongs_to :jovem
  belongs_to :tipo_infracao
end
