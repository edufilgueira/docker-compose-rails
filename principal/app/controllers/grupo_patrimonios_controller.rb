
# frozen_string_literal: true

class GrupoPatrimoniosController < PatrimonioApplicationController
  before_action :set_grupo_patrimonio, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.grupo_patrimonio').pluralize, :grupo_patrimonios_path
  add_breadcrumb 'Detalhe', :grupo_patrimonio_path, only: [:show]
  add_breadcrumb 'Novo', :new_grupo_patrimonio_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_grupo_patrimonio_path, only: %i[edit update]

  respond_to :html
  def index
    @grupo_patrimonios = GrupoPatrimonio.all
  end

  def show; end

  def new
    @grupo_patrimonio = GrupoPatrimonio.new
  end

  def edit; end

  def create
    @grupo_patrimonio = GrupoPatrimonio.new(grupo_patrimonio_params)

    respond_to do |format|
      if @grupo_patrimonio.save
        format.html { redirect_to grupo_patrimonios_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @grupo_patrimonio }
      else
        format.html { render :new }
        format.json { render json: @grupo_patrimonio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @grupo_patrimonio.update(grupo_patrimonio_params)
      redirect_to grupo_patrimonios_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @grupo_patrimonio.destroy
        format.html { redirect_to grupo_patrimonios_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @grupo_patrimonio.errors.full_messages[0] if @grupo_patrimonio.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_grupo_patrimonio
    @grupo_patrimonio = GrupoPatrimonio.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def grupo_patrimonio_params
    params.require(:grupo_patrimonio).permit(:codigo, :nome, :categoria_patrimonio_id)
  end
end
