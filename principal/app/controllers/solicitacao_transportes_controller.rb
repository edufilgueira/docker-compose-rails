
# frozen_string_literal: true

class SolicitacaoTransportesController < TransporteApplicationController
  before_action :set_solicitacao_transporte, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.solicitacao_transporte').pluralize, :solicitacao_transportes_path
  add_breadcrumb 'Detalhe', :solicitacao_transporte_path, only: [:show]
  add_breadcrumb 'Novo', :new_solicitacao_transporte_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_solicitacao_transporte_path, only: %i[edit update]

  respond_to :html
  def index
    @solicitacoes_aguardando = SolicitacaoTransporte.where(status: nil)
    @solicitacoes_autorizadas = SolicitacaoTransporte.where(status: 'autorizado')
    @solicitacoes_canceladas = SolicitacaoTransporte.where(status: 'cancelado')
    @solicitacao_transportes = SolicitacaoTransporte.all

    if current_usuario.pessoa.funcoes.map(&:nome).include? 'Gestor de transporte'
      @q = @solicitacao_transportes.ransack(params[:q])
      @solicitacao_transportes = @q.result
     
    else
      area_id = current_usuario.pessoa.funcoes.map(&:area).map(&:to_param)
      @solicitacoes_aguardando = @solicitacoes_aguardando.where(area_id: area_id)
      @solicitacoes_autorizadas = @solicitacoes_autorizadas.where(area_id: area_id)
      @solicitacoes_canceladas = @solicitacoes_canceladas.where(area_id: area_id)
      @solicitacao_transportes = @solicitacao_transportes.where(area_id: area_id)
    end

    @solicitacoes = if params['status'] == 'autorizado'
          @solicitacoes_autorizadas
        elsif params['status'] == 'cancelado'
          @solicitacoes_canceladas
        else
          @solicitacoes_aguardando
      end

    @solicitacoes.order!( data_transporte: :desc, hora_solicitada: :desc)
  end

  def show; end

  def new
    @solicitacao_transporte = SolicitacaoTransporte.new
  end

  def edit; end

  def autorizar
    @solicitacao_autorizada = SolicitacaoTransporte.find(params[:id])
    @solicitacao_autorizada.update_attributes(status: 'autorizado')
    @email_solicitante = @solicitacao_autorizada.destinado_para.usuario.email
    EnviarEmailMailer.autorizar_transporte({solicitacao: @solicitacoes_autorizada, email: @email_solicitante}).deliver_now
    flash[:notice] = 'Autorizado com sucesso!'
    redirect_to action: :index
  end

  def justificar_cancelamento
    @solicitacao_transporte_id = params[:id]

    respond_to do |format|
      format.js
    end
  end

  def salvar_justificativa_cancelamento
    @solicitacao_cancelada =  SolicitacaoTransporte.find(params[:frm][:id])
    @solicitacao_cancelada.update_attributes(justificativa_cancelamento: params[:frm][:justificativa_cancelamento], status: params[:frm][:status])
    @email_solicitante = @solicitacao_cancelada.destinado_para.usuario.email
    EnviarEmailMailer.cancelar_transporte({solicitacao: @solicitacao_cancelada, email: @email_solicitante}).deliver_now
    flash[:notice] = 'Cancelado com sucesso!'
    redirect_to action: :index
  end
  
  def create
    @solicitacao_transporte = SolicitacaoTransporte.new(solicitacao_transporte_params)

    respond_to do |format|
      if @solicitacao_transporte.save
        @email = current_usuario.email
        EnviarEmailMailer.solicitar_transporte({solicitacao: @solicitacao_transporte, email: @email}).deliver_now
        format.html { redirect_to solicitacao_transportes_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @solicitacao_transporte }
      else
        format.html { render :new }
        format.json { render json: @solicitacao_transporte.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @solicitacao_transporte.update(solicitacao_transporte_params)
      redirect_to solicitacao_transportes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @solicitacao_transporte.destroy
        format.html { redirect_to solicitacao_transportes_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @solicitacao_transporte.errors.full_messages[0] if @solicitacao_transporte.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_solicitacao_transporte
    @solicitacao_transporte = SolicitacaoTransporte.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def solicitacao_transporte_params
    params.require(:solicitacao_transporte).permit(:tipo_solicitacao_transporte_id, :area_id, :destinado_para_id, :data_transporte, :data_retorno, :hora_solicitada, :hora_prevista_retorno, :origem, :destino, :justificativa, :urgente, :justificativa_urgencia)
  end
end
