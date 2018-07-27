
# frozen_string_literal: true

class UnidadesSocioeducativasController < AdminApplicationController
  before_action :set_unidade_socioeducativa, only: %i[show edit update destroy]
  add_breadcrumb 'Unidades Socioeducativas', :unidades_socioeducativas_path
  add_breadcrumb 'Detalhe', :unidade_socioeducativa_path, only: [:show]
  add_breadcrumb 'Novo', :new_unidade_socioeducativa_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_unidade_socioeducativa_path, only: %i[edit update]

  respond_to :html
  def index
    @unidades_socioeducativas = UnidadeSocioeducativa.all
  end

  def show; end

  def new
    @unidade_socioeducativa = UnidadeSocioeducativa.new
  end

  def edit; end

  def create
    @unidade_socioeducativa = UnidadeSocioeducativa.new(unidade_socioeducativa_params)

    respond_to do |format|
      if @unidade_socioeducativa.save
        format.html { redirect_to unidades_socioeducativas_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @unidade_socioeducativa }
      else
        format.html { render :new }
        format.json { render json: @unidade_socioeducativa.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @unidade_socioeducativa.update(unidade_socioeducativa_params)
      redirect_to unidades_socioeducativas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @unidade_socioeducativa.destroy
        format.html { redirect_to unidades_socioeducativas_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @unidade_socioeducativa.errors.full_messages[0] if @unidade_socioeducativa.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_unidade_socioeducativa
    @unidade_socioeducativa = UnidadeSocioeducativa.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def unidade_socioeducativa_params
    params.require(:unidade_socioeducativa).permit(:nome, :sigla, :endereco)
    end
    end
