# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Andamento, type: :model do
  subject { FactoryBot.create(:andamento) }
  it 'destinatario must be kind of area' do
    expect(subject.destinatario).to be_kind_of(Area)
  end
end
