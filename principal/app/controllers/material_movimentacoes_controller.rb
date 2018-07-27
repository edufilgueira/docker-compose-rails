
# frozen_string_literal: true

class MaterialMovimentacoesController < MaterialApplicationController
  before_action :set_material_movimentacao, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.material_movimentacao').pluralize, :material_movimentacoes_path
  add_breadcrumb 'Detalhe', :material_movimentacao_path, only: [:show]
  add_breadcrumb 'Novo', :new_material_movimentacao_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_material_movimentacao_path, only: %i[edit update]

  respond_to :html
  def index
    @material_movimentacoes = MaterialMovimentacao.all
  end

  def show; end

  def new
    @material_movimentacao = MaterialMovimentacao.new
  end

  def edit; end

  def create
    @material_movimentacao = MaterialMovimentacao.new(material_movimentacao_params)

    respond_to do |format|
      if @material_movimentacao.save
        format.html { redirect_to material_movimentacoes_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @material_movimentacao }
      else
        format.html { render :new }
        format.json { render json: @material_movimentacao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @material_movimentacao.update(material_movimentacao_params)
      redirect_to material_movimentacoes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @material_movimentacao.destroy
        format.html { redirect_to material_movimentacoes_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @material_movimentacao.errors.full_messages[0] if @material_movimentacao.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_material_movimentacao
    @material_movimentacao = MaterialMovimentacao.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def material_movimentacao_params
    params.require(:material_movimentacao).permit(:material_id, :unidade_socioeducativa_id, :quantidade_movimentada, :tipo_movimentacao)
  end
end
