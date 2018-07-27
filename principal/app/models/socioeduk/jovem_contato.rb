class Socioeduk::JovemContato < ApplicationRecord
  belongs_to :socioeduk_jovem
  belongs_to :socioeduk_tipo_contato
end
