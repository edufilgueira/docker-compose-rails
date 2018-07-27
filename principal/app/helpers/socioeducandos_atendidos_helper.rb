# frozen_string_literal: true

module SocioeducandosAtendidosHelper
  def meses
    I18n.t('date.month_names').each_with_index.to_a.slice(1, 12)
  end

  def nome_mes(mes)
    I18n.t('date.month_names')[mes] if mes.present?
  end

  def anos_disponiveis
    (2015..Date.current.year + 5).to_a
  end
end
