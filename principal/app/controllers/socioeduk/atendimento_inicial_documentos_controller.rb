
# frozen_string_literal: true

class Socioeduk::AtendimentoInicialDocumentosController < RecepcaoApplicationController
  before_action :set_socioeduk_atendimento_inicial_documento, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.socioeduk_atendimento_inicial_documento').pluralize, :socioeduk_atendimento_inicial_documentos_path
  add_breadcrumb 'Detalhe', :socioeduk_atendimento_inicial_documento_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_atendimento_inicial_documento_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_atendimento_inicial_documento_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeduk_atendimento_inicial_documentos = Socioeduk::AtendimentoInicialDocumento.all
  end

  def show; end

  def new
    @socioeduk_atendimento_inicial_documento = Socioeduk::AtendimentoInicialDocumento.new
  end

  def edit; end

  def create
    @socioeduk_atendimento_inicial_documento = Socioeduk::AtendimentoInicialDocumento.new(socioeduk_atendimento_inicial_documento_params)

    respond_to do |format|
      if @socioeduk_atendimento_inicial_documento.save
        format.html { redirect_to socioeduk_atendimento_inicial_documentos_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @socioeduk_atendimento_inicial_documento }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_atendimento_inicial_documento.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_atendimento_inicial_documento.update(socioeduk_atendimento_inicial_documento_params)
      redirect_to socioeduk_atendimento_inicial_documentos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_atendimento_inicial_documento.destroy
        format.html { redirect_to socioeduk_atendimento_inicial_documentos_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @socioeduk_atendimento_inicial_documento.errors.full_messages[0] if @socioeduk_atendimento_inicial_documento.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_atendimento_inicial_documento
    @socioeduk_atendimento_inicial_documento = Socioeduk::AtendimentoInicialDocumento.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_atendimento_inicial_documento_params
    params.require(:socioeduk_atendimento_inicial_documento).permit(:descricao, :atendimento_inicial_id, :documento_forma_entrada_id, :documento)
  end
end
