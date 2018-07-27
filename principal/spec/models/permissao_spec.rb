# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Permissao, type: :model do
  context 'como admin' do
    subject { FactoryBot.create(:permissao) }

    it 'deve responder verdadeiro para admin?' do
      expect(subject).to be_admin
    end
  end

  context 'como usuario comum' do
    subject { FactoryBot.create(:permissao_nao_admin) }

    it 'deve responder falso para admin?' do
      expect(subject).to_not be_admin
    end
  end
end
