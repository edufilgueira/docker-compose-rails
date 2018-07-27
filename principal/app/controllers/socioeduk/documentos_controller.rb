
# frozen_string_literal: true

class Socioeduk::DocumentosController < RecepcaoApplicationController
  before_action :set_socioeduk_documento, only: %i[show edit update destroy]
  before_action :set_jovem
  add_breadcrumb I18n.t('activerecord.models.socioeduk_documento').pluralize, :socioeduk_documentos_path
  add_breadcrumb 'Detalhe', :socioeduk_documento_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_documento_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_documento_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeduk_documentos = Socioeduk::Documento.all
  end

  def show; end

  def new
    @socioeduk_documento = Socioeduk::Documento.new
    @url = :socioeduk_jovem_documentos
  end

  def edit
    @url = :socioeduk_jovem_documento
  end

  def create
    @socioeduk_documento = Socioeduk::Documento.new(socioeduk_documento_params)
    @socioeduk_documento.jovem = @socioeduk_jovem

    if @socioeduk_documento.save
      redirect_to @socioeduk_jovem, notice: I18n.t('messages.cadastro_sucesso')
    else
      @url = :socioeduk_jovem_documentos
      render :new
    end
  end

  def update
    if @socioeduk_documento.update(socioeduk_documento_params)
      redirect_to @socioeduk_jovem, notice: t('messages.atualizado_sucesso')
    else
      @url = :socioeduk_jovem_documento
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_documento.destroy
        format.html { redirect_to @socioeduk_jovem, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @socioeduk_documento.errors.full_messages[0] if @socioeduk_documento.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_documento
    @socioeduk_documento = Socioeduk::Documento.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_documento_params
    params.require(:socioeduk_documento).permit(:jovem_id, :cpf, :rg_numero, :rg_data_emissao, :rg_orgao_emissor, :rg_uf_emissao, :certidao_nascimento, :certidao_numero, :certidao_pagina, :certidao_livro, :certidao_data_emissao, :certidao_uf_emissao, :cpts_numero, :ctps_serie, :ctps_data_emissao, :ctps_uf_emissao, :titulo_numero, :titulo_serie, :titulo_secao, :pis_numero, :reservista_numero, :deleted_at)
  end

  def set_jovem
    @socioeduk_jovem = Socioeduk::Jovem.find(params[:jovem_id])
  end
end
