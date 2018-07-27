# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClassePatrimonio, type: :model do
  subject { FactoryBot.create(:classe_patrimonio) }
  it 'deve retornar no to_s o seu nome' do
    expect(subject.to_s).to eql(subject.nome)
  end
end
