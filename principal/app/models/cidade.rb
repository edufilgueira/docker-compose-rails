class Cidade < ApplicationRecord
  belongs_to :estado
  has_many :socioeduk_endereco_jovens
end
