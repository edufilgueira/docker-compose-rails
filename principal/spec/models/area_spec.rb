# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Area, type: :model do
  subject { FactoryBot.create(:area) }
  it 'can be created without a unidade socioeducativa' do
    area = described_class.new
    area.nome = 'foo'
    area.sigla = 'bar'
    area.unidade_socioeducativa = nil
    expect(area.save).to be true
  end

  it 'respond the name to to_s' do
    expect(subject.to_s).to be_eql(subject.nome)
  end
end
