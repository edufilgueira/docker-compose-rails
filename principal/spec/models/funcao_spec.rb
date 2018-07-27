# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Funcao, type: :model do
  subject { FactoryBot.create(:funcao) }
  it 'deve mostrar o nome no to_s' do
    expect(subject.to_s).to eq(subject.nome)
  end
end
