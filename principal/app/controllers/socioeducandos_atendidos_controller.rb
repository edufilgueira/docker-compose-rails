
# frozen_string_literal: true

class SocioeducandosAtendidosController < IndicadorApplicationController
  before_action :set_socioeducando_atendido, only: %i[show edit update destroy]
  add_breadcrumb 'Socioeducandos Atendidos', :socioeducandos_atendidos_path
  add_breadcrumb 'Detalhe', :socioeducando_atendido_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeducando_atendido_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeducando_atendido_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeducandos_atendidos = SocioeducandoAtendido.all
  end

  def show; end

  def new
    @socioeducando_atendido = SocioeducandoAtendido.new
  end

  def edit; end

  def create
    @socioeducando_atendido = SocioeducandoAtendido.new(socioeducando_atendido_params)

    respond_to do |format|
      if @socioeducando_atendido.save
        format.html { redirect_to socioeducandos_atendidos_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @socioeducando_atendido }
      else
        format.html { render :new }
        format.json { render json: @socioeducando_atendido.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeducando_atendido.update(socioeducando_atendido_params)
      redirect_to socioeducandos_atendidos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeducando_atendido.destroy
        format.html { redirect_to socioeducandos_atendidos_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @socioeducando_atendido.errors.full_messages[0] if @socioeducando_atendido.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  def filter
    @socioeducandos_atendidos = SocioeducandoAtendido.where(unidade_socioeducativa_id: params[:unidade], ano: params[:ano], mes: params[:mes])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeducando_atendido
    @socioeducando_atendido = SocioeducandoAtendido.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeducando_atendido_params
    params.require(:socioeducando_atendido).permit(:ano, :mes, :unidade_socioeducativa_id, :quantidade)
    end
    end
