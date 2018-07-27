
# frozen_string_literal: true

class CategoriaPatrimoniosController < PatrimonioApplicationController
  before_action :set_categoria_patrimonio, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.categoria_patrimonio').pluralize, :categoria_patrimonios_path
  add_breadcrumb 'Detalhe', :categoria_patrimonio_path, only: [:show]
  add_breadcrumb 'Novo', :new_categoria_patrimonio_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_categoria_patrimonio_path, only: %i[edit update]

  respond_to :html
  def index
    @categoria_patrimonios = CategoriaPatrimonio.all
  end

  def show; end

  def new
    @categoria_patrimonio = CategoriaPatrimonio.new
  end

  def edit; end

  def create
    @categoria_patrimonio = CategoriaPatrimonio.new(categoria_patrimonio_params)

    respond_to do |format|
      if @categoria_patrimonio.save
        format.html { redirect_to categoria_patrimonios_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @categoria_patrimonio }
      else
        format.html { render :new }
        format.json { render json: @categoria_patrimonio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @categoria_patrimonio.update(categoria_patrimonio_params)
      redirect_to categoria_patrimonios_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @categoria_patrimonio.destroy
        format.html { redirect_to categoria_patrimonios_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @categoria_patrimonio.errors.full_messages[0] if @categoria_patrimonio.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_categoria_patrimonio
    @categoria_patrimonio = CategoriaPatrimonio.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def categoria_patrimonio_params
    params.require(:categoria_patrimonio).permit(:nome)
  end
end
