# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IndicadorUnidadeMedida, type: :model do
  subject { FactoryBot.create(:indicador_unidade_medida) }
  it 'must repond to a name' do
    expect(subject.to_s).to be_eql(subject.nome)
  end
end
