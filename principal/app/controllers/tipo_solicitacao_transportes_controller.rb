
# frozen_string_literal: true

class TipoSolicitacaoTransportesController < TransporteApplicationController
  before_action :set_tipo_solicitacao_transporte, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.tipo_solicitacao_transporte').pluralize, :tipo_solicitacao_transportes_path
  add_breadcrumb 'Detalhe', :tipo_solicitacao_transporte_path, only: [:show]
  add_breadcrumb 'Novo', :new_tipo_solicitacao_transporte_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_tipo_solicitacao_transporte_path, only: %i[edit update]

  respond_to :html
  def index
    @tipo_solicitacao_transportes = TipoSolicitacaoTransporte.all
  end

  def show; end

  def new
    @tipo_solicitacao_transporte = TipoSolicitacaoTransporte.new
  end

  def edit; end

  def create
    @tipo_solicitacao_transporte = TipoSolicitacaoTransporte.new(tipo_solicitacao_transporte_params)

    respond_to do |format|
      if @tipo_solicitacao_transporte.save
        format.html { redirect_to tipo_solicitacao_transportes_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @tipo_solicitacao_transporte }
      else
        format.html { render :new }
        format.json { render json: @tipo_solicitacao_transporte.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @tipo_solicitacao_transporte.update(tipo_solicitacao_transporte_params)
      redirect_to tipo_solicitacao_transportes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @tipo_solicitacao_transporte.destroy
        format.html { redirect_to tipo_solicitacao_transportes_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @tipo_solicitacao_transporte.errors.full_messages[0] if @tipo_solicitacao_transporte.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tipo_solicitacao_transporte
    @tipo_solicitacao_transporte = TipoSolicitacaoTransporte.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def tipo_solicitacao_transporte_params
    params.require(:tipo_solicitacao_transporte).permit(:tipo)
  end
end
