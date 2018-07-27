# encoding: utf-8
class Socioeduk::EnderecoJovensController < ApplicationController
  before_action :set_socioeduk_endereco_jovem, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_endereco_jovem").pluralize, :socioeduk_endereco_jovens_path
  add_breadcrumb "Detalhe", :socioeduk_endereco_jovem_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_endereco_jovem_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_endereco_jovem_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_endereco_jovens = Socioeduk::EnderecoJovem.all
  end

  def show
  end

  def new
    @socioeduk_endereco_jovem = Socioeduk::EnderecoJovem.new
  end

  def edit
  end

  def create
    @socioeduk_endereco_jovem = Socioeduk::EnderecoJovem.new(socioeduk_endereco_jovem_params)

    respond_to do |format|
      if @socioeduk_endereco_jovem.save
        format.html { redirect_to socioeduk_endereco_jovens_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_endereco_jovem }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_endereco_jovem.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_endereco_jovem.update(socioeduk_endereco_jovem_params)
      redirect_to socioeduk_endereco_jovens_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_endereco_jovem.destroy
        format.html { redirect_to socioeduk_endereco_jovens_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_endereco_jovem.errors.full_messages[0] if @socioeduk_endereco_jovem.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_endereco_jovem
      @socioeduk_endereco_jovem = Socioeduk::EnderecoJovem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_endereco_jovem_params
        params.require(:socioeduk_endereco_jovem).permit(:jovem_id, :cidade_id, :rua, :numero, :complemento, :bairro, :cep)
    end
end
