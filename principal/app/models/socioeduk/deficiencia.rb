# frozen_string_literal: true

class Socioeduk::Deficiencia < ApplicationRecord
  belongs_to :jovem
  belongs_to :deficiencias
end
