
# frozen_string_literal: true

class Socioeduk::EnderecosController < ApplicationController
  before_action :set_socioeduk_endereco, only: %i[show edit update destroy]
  before_action :set_jovem
  add_breadcrumb I18n.t('activerecord.models.socioeduk_endereco').pluralize, :socioeduk_jovem_enderecos_path
  add_breadcrumb 'Detalhe', :socioeduk_jovem_endereco_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_jovem_endereco_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_jovem_endereco_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeduk_enderecos = Socioeduk::Endereco.all
  end

  def show; end

  def new
    @socioeduk_endereco = Socioeduk::Endereco.new
    @url = :socioeduk_jovem_enderecos
  end

  def edit
    @url = :socioeduk_jovem_endereco
  end

  def create
    @socioeduk_endereco = Socioeduk::Endereco.new(socioeduk_endereco_params)
    @socioeduk_endereco.jovem = @socioeduk_jovem

    if @socioeduk_endereco.save
      redirect_to @socioeduk_jovem, notice: I18n.t('messages.cadastro_sucesso')
    else
      @url = :socioeduk_jovem_enderecos
      render :new
    end
  end

  def update
    if @socioeduk_endereco.update(socioeduk_endereco_params)
      redirect_to @socioeduk_jovem, notice: t('messages.atualizado_sucesso')
    else
      @url = :socioeduk_jovem_enderecos
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_endereco.destroy
        format.html { redirect_to @socioeduk_jovem, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @socioeduk_endereco.errors.full_messages[0] if @socioeduk_endereco.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_endereco
    @socioeduk_endereco = Socioeduk::Endereco.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_endereco_params
    params.require(:socioeduk_endereco).permit(:cep, :logradouro, :numero, :bairro, :complemento, :cidade, :estado, :ponto_referencia, :tipo_contato_id)
  end

  def set_jovem
    @socioeduk_jovem = Socioeduk::Jovem.find(params[:jovem_id])
  end
end
