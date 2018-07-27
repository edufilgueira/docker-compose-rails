
# frozen_string_literal: true

class ServicosRealizadosController < IndicadorApplicationController
  before_action :set_servico_realizado, only: %i[show edit update destroy]
  add_breadcrumb 'Servicos Realizados', :servicos_realizados_path
  add_breadcrumb 'Detalhe', :servico_realizado_path, only: [:show]
  add_breadcrumb 'Novo', :new_servico_realizado_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_servico_realizado_path, only: %i[edit update]

  respond_to :html
  def index
    @servicos_realizados = ServicoRealizado.all
  end

  def show; end

  def new
    @servico_realizado = ServicoRealizado.new
  end

  def edit; end

  def create
    @servico_realizado = ServicoRealizado.new(servico_realizado_params)

    respond_to do |format|
      if @servico_realizado.save
        format.html { redirect_to servicos_realizados_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @servico_realizado }
      else
        format.html { render :new }
        format.json { render json: @servico_realizado.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @servico_realizado.update(servico_realizado_params)
      redirect_to servicos_realizados_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @servico_realizado.destroy
        format.html { redirect_to servicos_realizados_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @servico_realizado.errors.full_messages[0] if @servico_realizado.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_servico_realizado
    @servico_realizado = ServicoRealizado.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def servico_realizado_params
    params.require(:servico_realizado).permit(:eixo_id, :gestor_eixo_id, :unidade_socioeducativa_id, :gestor_unidade_id, :area_id, :gestor_area_id, :qtd_socioeducandos_atendidos, :servico_id, :quantidade_realizados, :desempenho_meta, :meta, :ano, :mes)
    end
    end
