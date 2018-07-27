
# frozen_string_literal: true

class PostoCombustiveisController < TransporteApplicationController
  before_action :set_posto_combustivel, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.posto_combustivel').pluralize, :posto_combustiveis_path
  add_breadcrumb 'Detalhe', :posto_combustivel_path, only: [:show]
  add_breadcrumb 'Novo', :new_posto_combustivel_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_posto_combustivel_path, only: %i[edit update]

  respond_to :html
  def index
    @posto_combustiveis = PostoCombustivel.all
  end

  def show; end

  def new
    @posto_combustivel = PostoCombustivel.new
  end

  def edit; end

  def create
    @posto_combustivel = PostoCombustivel.new(posto_combustivel_params)

    respond_to do |format|
      if @posto_combustivel.save
        format.html { redirect_to posto_combustiveis_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @posto_combustivel }
      else
        format.html { render :new }
        format.json { render json: @posto_combustivel.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @posto_combustivel.update(posto_combustivel_params)
      redirect_to posto_combustiveis_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @posto_combustivel.destroy
        format.html { redirect_to posto_combustiveis_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @posto_combustivel.errors.full_messages[0] if @posto_combustivel.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_posto_combustivel
    @posto_combustivel = PostoCombustivel.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def posto_combustivel_params
    params.require(:posto_combustivel).permit(:nome, :cnpj, :rua, :numero, :bairro)
  end
end
