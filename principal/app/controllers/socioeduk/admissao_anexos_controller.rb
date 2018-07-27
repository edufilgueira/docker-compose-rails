
# frozen_string_literal: true

class Socioeduk::AdmissaoAnexosController < RecepcaoApplicationController
  before_action :set_socioeduk_admissao_anexo, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.socioeduk_admissao_anexo').pluralize, :socioeduk_admissao_anexos_path
  add_breadcrumb 'Detalhe', :socioeduk_admissao_anexo_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_admissao_anexo_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_admissao_anexo_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeduk_admissao_anexos = Socioeduk::AdmissaoAnexo.all
  end

  def show; end

  def new
    @socioeduk_admissao_anexo = Socioeduk::AdmissaoAnexo.new
  end

  def edit; end

  def create
    @socioeduk_admissao_anexo = Socioeduk::AdmissaoAnexo.new(socioeduk_admissao_anexo_params)

    respond_to do |format|
      if @socioeduk_admissao_anexo.save
        format.html { redirect_to socioeduk_admissao_anexos_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @socioeduk_admissao_anexo }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_admissao_anexo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_admissao_anexo.update(socioeduk_admissao_anexo_params)
      redirect_to socioeduk_admissao_anexos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_admissao_anexo.destroy
        format.html { redirect_to socioeduk_admissao_anexos_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @socioeduk_admissao_anexo.errors.full_messages[0] if @socioeduk_admissao_anexo.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_admissao_anexo
    @socioeduk_admissao_anexo = Socioeduk::AdmissaoAnexo.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_admissao_anexo_params
    params.require(:socioeduk_admissao_anexo).permit(:jovem_id, :kit, :documentos)
  end
end
