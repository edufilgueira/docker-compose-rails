
# frozen_string_literal: true

class GestoresEixosController < AdminApplicationController
  before_action :set_gestor_eixo, only: %i[show edit update destroy]
  add_breadcrumb 'Gestores Eixos', :gestores_eixos_path
  add_breadcrumb 'Detalhe', :gestor_eixo_path, only: [:show]
  add_breadcrumb 'Novo', :new_gestor_eixo_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_gestor_eixo_path, only: %i[edit update]

  respond_to :html
  def index
    @gestores_eixos = GestorEixo.all
  end

  def show; end

  def new
    @gestor_eixo = GestorEixo.new
  end

  def edit; end

  def create
    @gestor_eixo = GestorEixo.new(gestor_eixo_params)

    respond_to do |format|
      if @gestor_eixo.save
        format.html { redirect_to gestores_eixos_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @gestor_eixo }
      else
        format.html { render :new }
        format.json { render json: @gestor_eixo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @gestor_eixo.update(gestor_eixo_params)
      redirect_to gestores_eixos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @gestor_eixo.destroy
        format.html { redirect_to gestores_eixos_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @gestor_eixo.errors.full_messages[0] if @gestor_eixo.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  def eixos
    @eixos = GestorEixo.get_by_eixo(params[:servico_realizado][:eixo_id])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gestor_eixo
    @gestor_eixo = GestorEixo.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def gestor_eixo_params
    params.require(:gestor_eixo).permit(:eixo_id, :pessoa_id, :data_inicio, :data_termino, :ativo)
  end
end
