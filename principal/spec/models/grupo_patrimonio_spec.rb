# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GrupoPatrimonio, type: :model do
  subject { FactoryBot.create(:grupo_patrimonio) }
  it 'deve retornar no to_s o seu nome' do
    expect(subject.to_s).to eql(subject.nome)
  end
end
