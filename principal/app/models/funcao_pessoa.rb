# frozen_string_literal: true

class FuncaoPessoa < ApplicationRecord
  belongs_to :funcao
  belongs_to :pessoa
end
