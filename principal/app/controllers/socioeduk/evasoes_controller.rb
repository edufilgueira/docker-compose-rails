
# frozen_string_literal: true

class Socioeduk::EvasoesController < RecepcaoApplicationController
  before_action :set_socioeduk_evasao, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.socioeduk_evasao').pluralize, :socioeduk_evasoes_path
  add_breadcrumb 'Detalhe', :socioeduk_evasao_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_evasao_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_evasao_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeduk_evasoes = Socioeduk::Evasao.all
  end

  def show; end

  def new
    @socioeduk_evasao = Socioeduk::Evasao.new
  end

  def edit; end

  def create
    @socioeduk_evasao = Socioeduk::Evasao.new(socioeduk_evasao_params)

    respond_to do |format|
      if @socioeduk_evasao.save
        format.html { redirect_to socioeduk_evasoes_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @socioeduk_evasao }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_evasao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_evasao.update(socioeduk_evasao_params)
      redirect_to socioeduk_evasoes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_evasao.destroy
        format.html { redirect_to socioeduk_evasoes_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @socioeduk_evasao.errors.full_messages[0] if @socioeduk_evasao.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_evasao
    @socioeduk_evasao = Socioeduk::Evasao.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_evasao_params
    params.require(:socioeduk_evasao).permit(:jovem_id, :data_evasao, :evadido, :retornou_em, :tipo_evasao, :observacoes, :motivo)
  end
end
