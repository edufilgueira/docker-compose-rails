class Socioeduk::EnderecoJovem < ApplicationRecord
  belongs_to :jovem
  belongs_to :cidade
end
