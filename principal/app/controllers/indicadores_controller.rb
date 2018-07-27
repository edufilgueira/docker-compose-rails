
# frozen_string_literal: true

class IndicadoresController < IndicadorApplicationController
  before_action :set_indicador, only: %i[show edit update destroy]
  add_breadcrumb 'Indicadores', :indicadores_path, only: :index
  add_breadcrumb 'Criar Indicadores', :indicadores_list_path, only: %i[list create new]
  add_breadcrumb 'Editar Indicadores', :indicadores_list_path, only: %i[edit update]
  add_breadcrumb 'Relatório', :indicadores_relatorio_path, only: :relatorio

  def index
    @quantidade = 0
    if params[:ano].blank? && params[:mes].blank?
      @indicadores = ServicoRealizado.includes(:unidade_socioeducativa).where(ano: Date.current.year, mes: Date.current.month)
    else
      @indicadores = ServicoRealizado.includes(:unidade_socioeducativa).where(ano: params[:ano], mes: params[:mes])
    end
    @indicadores&.each { |i| @quantidade += i.qtd_socioeducandos_atendidos }
    @desempenho = ((@indicadores.sum(:quantidade_realizados)&.to_f / @indicadores.sum(:meta)&.to_f) * 100).round(2) if @indicadores.present? # /
  end

  def relatorio
    @indicadores = ServicoRealizado.includes(:unidade_socioeducativa).where(ano: params[:ano], mes: params[:mes])
    @groups_count = ServicoRealizado.includes(:unidade_socioeducativa).select(:unidade_socioeducativa_id).group(:unidade_socioeducativa_id).count
    render layout: 'clean'
  end

  def list
    @indicadores = Indicador.all
  end

  def show; end

  def new
    @indicador = Indicador.new
  end

  def edit; end

  def create
    @indicador = Indicador.new(indicador_params)

    respond_to do |format|
      if @indicador.save
        format.html { redirect_to indicadores_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @indicador }
      else
        format.html { render :new }
        format.json { render json: @indicador.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @indicador.update(indicador_params)
      redirect_to indicadores_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @indicador.destroy
        format.html { redirect_to indicadores_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @indicador.errors.full_messages[0] if @indicador.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_indicador
    @indicador = Indicador.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def indicador_params
    params.require(:indicador).permit(:indicador_unidade_medida_id, :area_id, :melhor_sentido, :objetivo, :abrangencia, :periodicidade_coleta, :como_coletar, :periodicidade_avaliacao, :como_calcular, :assunto, :nome, :indicador_assunto_id)
  end
end
