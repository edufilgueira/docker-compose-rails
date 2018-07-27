
# frozen_string_literal: true

class TipoDeCombustiveisController < TransporteApplicationController
  before_action :set_tipo_de_combustivel, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.tipo_de_combustivel').pluralize, :tipo_de_combustiveis_path
  add_breadcrumb 'Detalhe', :tipo_de_combustivel_path, only: [:show]
  add_breadcrumb 'Novo', :new_tipo_de_combustivel_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_tipo_de_combustivel_path, only: %i[edit update]

  respond_to :html
  def index
    @tipo_de_combustiveis = TipoDeCombustivel.all
  end

  def show; end

  def new
    @tipo_de_combustivel = TipoDeCombustivel.new
  end

  def edit; end

  def create
    @tipo_de_combustivel = TipoDeCombustivel.new(tipo_de_combustivel_params)

    respond_to do |format|
      if @tipo_de_combustivel.save
        format.html { redirect_to tipo_de_combustiveis_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @tipo_de_combustivel }
      else
        format.html { render :new }
        format.json { render json: @tipo_de_combustivel.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @tipo_de_combustivel.update(tipo_de_combustivel_params)
      redirect_to tipo_de_combustiveis_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @tipo_de_combustivel.destroy
        format.html { redirect_to tipo_de_combustiveis_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @tipo_de_combustivel.errors.full_messages[0] if @tipo_de_combustivel.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tipo_de_combustivel
    @tipo_de_combustivel = TipoDeCombustivel.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def tipo_de_combustivel_params
    params.require(:tipo_de_combustivel).permit(:nome)
  end
end
