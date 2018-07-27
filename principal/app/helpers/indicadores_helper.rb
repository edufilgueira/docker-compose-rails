# frozen_string_literal: true

module IndicadoresHelper
  def select_class_tr(porcentagem)
    classes = { (90..100) => 'table-success', (80..89) => 'table-primary', (70..79) => 'table-secondary', (60..69) => 'table-info',
                (50..59) => '', (40..49) => 'table-warning', (0..39) => '' }
    classes.select { |classe| classe === porcentagem&.to_f&.to_i }.values.first
  end

  def select_badge(porcentagem)
    classes = { (90..100) => 'crown.png', (80..89) => 'diamond.png', (70..79) => 'banner.png', (60..69) => 'gold-medal.png',
                (50..59) => 'silver-medal.png', (40..49) => 'bronze-medal.png', (0..39) => 'remove-button.png' }
    classes.select { |classe| classe === porcentagem&.to_f&.to_i }.values.first
  end

  def select_title(porcentagem)
    classes = { (90..100) => 'Master', (80..89) => 'Diamante', (70..79) => 'Platina', (60..69) => 'Ouro',
                (50..59) => 'Prata', (40..49) => 'Bronze', (0..39) => 'Sem classificação' }
    classes.select { |classe| classe === porcentagem&.to_f&.to_i }.values.first
  end
end
