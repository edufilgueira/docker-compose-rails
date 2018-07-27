# frozen_string_literal: true

class EstoquePatrimonioController < PatrimonioApplicationController
  def index
    @q = Patrimonio.ransack(params[:q])
    @patrimonios = @q.result
  end
end
