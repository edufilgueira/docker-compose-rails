
# frozen_string_literal: true

class Socioeduk::InfracoesController < RecepcaoApplicationController
  before_action :set_socioeduk_infracao, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.socioeduk_infracao').pluralize, :socioeduk_infracoes_path
  add_breadcrumb 'Detalhe', :socioeduk_infracao_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_infracao_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_infracao_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeduk_infracoes = Socioeduk::Infracao.all
  end

  def show; end

  def new
    @socioeduk_infracao = Socioeduk::Infracao.new
  end

  def edit; end

  def create
    @socioeduk_infracao = Socioeduk::Infracao.new(socioeduk_infracao_params)

    respond_to do |format|
      if @socioeduk_infracao.save
        format.html { redirect_to socioeduk_infracoes_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @socioeduk_infracao }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_infracao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_infracao.update(socioeduk_infracao_params)
      redirect_to socioeduk_infracoes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_infracao.destroy
        format.html { redirect_to socioeduk_infracoes_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @socioeduk_infracao.errors.full_messages[0] if @socioeduk_infracao.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_infracao
    @socioeduk_infracao = Socioeduk::Infracao.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_infracao_params
    params.require(:socioeduk_infracao).permit(:jovem_id, :tipo_infracao_id)
  end
end
