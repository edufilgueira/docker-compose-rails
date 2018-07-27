
# frozen_string_literal: true

class Socioeduk::AdmissoesController < RecepcaoApplicationController
  before_action :set_socioeduk_admissao, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.socioeduk_admissao').pluralize, :socioeduk_admissoes_path
  add_breadcrumb 'Detalhe', :socioeduk_admissao_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_admissao_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_admissao_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeduk_admissoes = Socioeduk::Admissao.all
  end

  def show; end

  def new
    @socioeduk_admissao = Socioeduk::Admissao.new
  end

  def edit; end

  def create
    @socioeduk_admissao = Socioeduk::Admissao.new(socioeduk_admissao_params)

    respond_to do |format|
      if @socioeduk_admissao.save
        format.html { redirect_to socioeduk_admissoes_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @socioeduk_admissao }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_admissao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_admissao.update(socioeduk_admissao_params)
      redirect_to socioeduk_admissoes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_admissao.destroy
        format.html { redirect_to socioeduk_admissoes_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @socioeduk_admissao.errors.full_messages[0] if @socioeduk_admissao.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_admissao
    @socioeduk_admissao = Socioeduk::Admissao.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_admissao_params
    params.require(:socioeduk_admissao).permit(:jovem_id, :unidade_socioeducativa_id, :rebebido_em, :tipo_desligamento_id, :desligado_em, :numero_processo)
  end
end
