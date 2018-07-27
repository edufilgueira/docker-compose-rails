# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'mapa_de_bordos/edit', type: :view do
  before(:each) do
    @mapa_de_bordo = assign(:mapa_de_bordo, FactoryBot.create(:mapa_de_bordo))
    assign(:responsaveis, Pessoa.all)
    assign(:motoristas, Pessoa.all)
  end

  it 'renders the edit mapa_de_bordo form' do
    render

    assert_select 'form[action=?][method=?]', mapa_de_bordo_path(@mapa_de_bordo), 'post' do
      assert_select 'select[name=?]', 'mapa_de_bordo[veiculo_id]'

      assert_select 'select[name=?]', 'mapa_de_bordo[tipo_vistoria]'

      assert_select 'select[name=?]', 'mapa_de_bordo[responsavel_id]'

      assert_select 'select[name=?]', 'mapa_de_bordo[motorista_id]'

      assert_select 'input[name=?]', 'mapa_de_bordo[km_inicial]'

      assert_select 'input[name=?]', 'mapa_de_bordo[km_final]'

      assert_select 'textarea[name=?]', 'mapa_de_bordo[percurso]'

      assert_select 'textarea[name=?]', 'mapa_de_bordo[parecer]'
    end
  end
end
