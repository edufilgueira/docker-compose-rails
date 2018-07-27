
# frozen_string_literal: true

class EixosController < AdminApplicationController
  before_action :set_eixo, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.eixo').pluralize, :eixos_path
  add_breadcrumb 'Detalhe', :eixo_path, only: [:show]
  add_breadcrumb 'Novo', :new_eixo_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_eixo_path, only: %i[edit update]

  respond_to :html
  def index
    @eixos = Eixo.all
  end

  def show; end

  def new
    @eixo = Eixo.new
  end

  def edit; end

  def create
    @eixo = Eixo.new(eixo_params)

    respond_to do |format|
      if @eixo.save
        format.html { redirect_to eixos_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @eixo }
      else
        format.html { render :new }
        format.json { render json: @eixo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @eixo.update(eixo_params)
      redirect_to eixos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @eixo.destroy
        format.html { redirect_to eixos_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @eixo.errors.full_messages[0] if @eixo.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_eixo
    @eixo = Eixo.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def eixo_params
    params.require(:eixo).permit(:nome)
    end
    end
