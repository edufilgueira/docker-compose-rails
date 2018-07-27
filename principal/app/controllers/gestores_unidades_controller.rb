
# frozen_string_literal: true

class GestoresUnidadesController < AdminApplicationController
  before_action :set_gestor_unidade, only: %i[show edit update destroy]
  add_breadcrumb 'Gestores Unidades', :gestores_unidades_path
  add_breadcrumb 'Detalhe', :gestor_unidade_path, only: [:show]
  add_breadcrumb 'Novo', :new_gestor_unidade_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_gestor_unidade_path, only: %i[edit update]

  respond_to :html
  def index
    @gestores_unidades = GestorUnidade.all
  end

  def show; end

  def new
    @gestor_unidade = GestorUnidade.new
  end

  def edit; end

  def create
    @gestor_unidade = GestorUnidade.new(gestor_unidade_params)

    respond_to do |format|
      if @gestor_unidade.save
        format.html { redirect_to gestores_unidades_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @gestor_unidade }
      else
        format.html { render :new }
        format.json { render json: @gestor_unidade.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @gestor_unidade.update(gestor_unidade_params)
      redirect_to gestores_unidades_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @gestor_unidade.destroy
        format.html { redirect_to gestores_unidades_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @gestor_unidade.errors.full_messages[0] if @gestor_unidade.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  def unidades
    @unidades = GestorUnidade.get_by_unidade(params[:servico_realizado][:unidade_socioeducativa_id])
    @areas = Area.where(unidade_socioeducativa_id: params[:servico_realizado][:unidade_socioeducativa_id])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gestor_unidade
    @gestor_unidade = GestorUnidade.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def gestor_unidade_params
    params.require(:gestor_unidade).permit(:unidade_socioeducativa_id, :pessoa_id, :data_inicio, :data_termino, :ativo)
    end
    end
