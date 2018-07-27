# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'depositos/show', type: :view do
  before(:each) do
    @deposito = assign(:deposito, Deposito.create!(
                                    nome: 'Nome'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Nome/)
  end
end
