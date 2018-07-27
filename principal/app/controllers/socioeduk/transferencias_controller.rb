
# frozen_string_literal: true

class Socioeduk::TransferenciasController < RecepcaoApplicationController
  before_action :set_socioeduk_transferencia, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.socioeduk_transferencia').pluralize, :socioeduk_transferencias_path
  add_breadcrumb 'Detalhe', :socioeduk_transferencia_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_transferencia_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_transferencia_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeduk_transferencias = Socioeduk::Transferencia.all
  end

  def show; end

  def new
    @socioeduk_transferencia = Socioeduk::Transferencia.new
  end

  def edit; end

  def create
    @socioeduk_transferencia = Socioeduk::Transferencia.new(socioeduk_transferencia_params)

    respond_to do |format|
      if @socioeduk_transferencia.save
        format.html { redirect_to socioeduk_transferencias_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @socioeduk_transferencia }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_transferencia.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_transferencia.update(socioeduk_transferencia_params)
      redirect_to socioeduk_transferencias_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_transferencia.destroy
        format.html { redirect_to socioeduk_transferencias_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @socioeduk_transferencia.errors.full_messages[0] if @socioeduk_transferencia.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_transferencia
    @socioeduk_transferencia = Socioeduk::Transferencia.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_transferencia_params
    params.require(:socioeduk_transferencia).permit(:unidade_socioeducativa_origem_id, :unidade_socioeducativa_destino_id, :admissao_id)
  end
end
