
# frozen_string_literal: true

class ColetaIndicadoresController < IndicadorApplicationController
  before_action :set_coleta_indicador, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.coleta_indicador').pluralize, :coleta_indicadores_path
  add_breadcrumb 'Detalhe', :coleta_indicador_path, only: [:show]
  add_breadcrumb 'Novo', :new_coleta_indicador_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_coleta_indicador_path, only: %i[edit update]

  respond_to :html
  def index
    indicador_id = coleta_indicador_params[:indicador_id]
    @coleta_indicadores = ColetaIndicador.where('indicador_id = ?', indicador_id)
  rescue ActionController::ParameterMissing
    @coleta_indicadores = ColetaIndicador.all
  end

  def show; end

  def preselect
    @coleta_indicador = ColetaIndicador.new
  end

  def new
    @coleta_indicador = ColetaIndicador.new
  end

  def edit; end

  def create
    @coleta_indicador ||= ColetaIndicador.new(coleta_indicador_params)
    @coleta_indicador.abrangencia_coleta = @coleta_indicador.indicador.abrangencia
    @coleta_indicador.periodo_coleta = @coleta_indicador.indicador.periodicidade_coleta
    respond_to do |format|
      if @coleta_indicador.save
        format.html { redirect_to coleta_indicadores_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @coleta_indicador }
      else
        format.html { render :new }
        format.json { render json: @coleta_indicador.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @coleta_indicador.update(coleta_indicador_params)
      redirect_to coleta_indicadores_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @coleta_indicador.destroy
        format.html { redirect_to coleta_indicadores_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @coleta_indicador.errors.full_messages[0] if @coleta_indicador.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_coleta_indicador
    @coleta_indicador = ColetaIndicador.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def coleta_indicador_params
    params.require(:coleta_indicador).permit(:indicador_id, :abrangencia_coleta, :area_id, :pessoa_id, :indice, :semestre, :quadrimestre, :trimestre, :mes, :quinzena, :semana, :ano, :periodo_coleta)
  end
end
