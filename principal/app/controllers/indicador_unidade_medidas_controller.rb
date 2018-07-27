
# frozen_string_literal: true

class IndicadorUnidadeMedidasController < IndicadorApplicationController
  before_action :set_indicador_unidade_medida, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.indicador_unidade_medida').pluralize, :indicador_unidade_medidas_path
  add_breadcrumb 'Detalhe', :indicador_unidade_medida_path, only: [:show]
  add_breadcrumb 'Novo', :new_indicador_unidade_medida_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_indicador_unidade_medida_path, only: %i[edit update]

  respond_to :html
  def index
    @indicador_unidade_medidas = IndicadorUnidadeMedida.all
  end

  def show; end

  def new
    @indicador_unidade_medida = IndicadorUnidadeMedida.new
  end

  def edit; end

  def create
    @indicador_unidade_medida = IndicadorUnidadeMedida.new(indicador_unidade_medida_params)

    respond_to do |format|
      if @indicador_unidade_medida.save
        format.html { redirect_to indicador_unidade_medidas_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @indicador_unidade_medida }
      else
        format.html { render :new }
        format.json { render json: @indicador_unidade_medida.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @indicador_unidade_medida.update(indicador_unidade_medida_params)
      redirect_to indicador_unidade_medidas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @indicador_unidade_medida.destroy
        format.html { redirect_to indicador_unidade_medidas_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @indicador_unidade_medida.errors.full_messages[0] if @indicador_unidade_medida.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_indicador_unidade_medida
    @indicador_unidade_medida = IndicadorUnidadeMedida.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def indicador_unidade_medida_params
    params.require(:indicador_unidade_medida).permit(:nome, :sigla)
  end
end
