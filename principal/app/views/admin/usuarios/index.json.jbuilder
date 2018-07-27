# frozen_string_literal: true

json.array! @usuarios, partial: 'usuarios/usuario', as: :usuario
