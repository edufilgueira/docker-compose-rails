# -*- coding: utf-8 -*-
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MapaDeBordo, type: :model do
  it { should belong_to :veiculo }
  it { should belong_to :responsavel }
  it { should belong_to :motorista }

  it 'vistorias includes diaria' do
    expect(MapaDeBordo.tipo_vistorias).to include('Diária')
  end
end
