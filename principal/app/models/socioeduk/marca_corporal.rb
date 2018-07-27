# frozen_string_literal: true

class Socioeduk::MarcaCorporal < ApplicationRecord
  belongs_to :jovem
  belongs_to :marca_corporal
end
