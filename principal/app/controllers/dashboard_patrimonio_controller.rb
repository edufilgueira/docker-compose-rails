# frozen_string_literal: true

class DashboardPatrimonioController < PatrimonioApplicationController
  def index
    @data = Date.today
    @bens = Patrimonio.all
    primeiro_dia_mes_corrente = Time.now.to_date.beginning_of_day
    ultimo_dia_mes_corrente = Time.now.to_date.end_of_day
    @bens_entradas = @bens.where('created_at between ? and ?', primeiro_dia_mes_corrente, ultimo_dia_mes_corrente)
    @bens_categoria = Patrimonio.left_outer_joins(item_patrimonio: { classe_patrimonio: { grupo_patrimonio: :categoria_patrimonio } }).group('categoria_patrimonios.nome').count('patrimonios')
    @bens_localizacao = Patrimonio.find_by_sql("SELECT
                                                CASE
                                                  WHEN deposito.nome IS NULL THEN area.nome
                                                  ELSE deposito.nome
                                                END AS local,
                                                categoria.nome AS categoria,
                                                COUNT(patrimonio.id) AS quantidade
                                                FROM patrimonios patrimonio
                                                LEFT JOIN item_patrimonios item ON item.id = patrimonio.item_patrimonio_id
                                                LEFT JOIN classe_patrimonios classe ON classe.id = item.classe_patrimonio_id
                                                LEFT JOIN grupo_patrimonios grupo ON grupo.id = classe.grupo_patrimonio_id
                                                LEFT JOIN categoria_patrimonios categoria ON categoria.id = grupo.categoria_patrimonio_id
                                                LEFT JOIN depositos deposito ON deposito.id = patrimonio.deposito_id
                                                LEFT JOIN areas area ON area.id = patrimonio.area_id
                                                GROUP BY local, categoria.nome
                                                ORDER BY quantidade DESC
                                              ")
  end
end
