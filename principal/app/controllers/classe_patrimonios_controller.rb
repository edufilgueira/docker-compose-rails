
# frozen_string_literal: true

class ClassePatrimoniosController < PatrimonioApplicationController
  before_action :set_classe_patrimonio, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.classe_patrimonio').pluralize, :classe_patrimonios_path
  add_breadcrumb 'Detalhe', :classe_patrimonio_path, only: [:show]
  add_breadcrumb 'Novo', :new_classe_patrimonio_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_classe_patrimonio_path, only: %i[edit update]

  respond_to :html
  def index
    @classe_patrimonios = ClassePatrimonio.all
  end

  def show; end

  def new
    @classe_patrimonio = ClassePatrimonio.new
  end

  def edit; end

  def create
    @classe_patrimonio = ClassePatrimonio.new(classe_patrimonio_params)

    respond_to do |format|
      if @classe_patrimonio.save
        format.html { redirect_to classe_patrimonios_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @classe_patrimonio }
      else
        format.html { render :new }
        format.json { render json: @classe_patrimonio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @classe_patrimonio.update(classe_patrimonio_params)
      redirect_to classe_patrimonios_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @classe_patrimonio.destroy
        format.html { redirect_to classe_patrimonios_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @classe_patrimonio.errors.full_messages[0] if @classe_patrimonio.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_classe_patrimonio
    @classe_patrimonio = ClassePatrimonio.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def classe_patrimonio_params
    params.require(:classe_patrimonio).permit(:grupo_patrimonio_id, :codigo, :nome)
  end
end
