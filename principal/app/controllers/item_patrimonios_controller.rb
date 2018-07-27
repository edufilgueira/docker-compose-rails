
# frozen_string_literal: true

class ItemPatrimoniosController < PatrimonioApplicationController
  before_action :set_item_patrimonio, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.item_patrimonio').pluralize, :item_patrimonios_path
  add_breadcrumb 'Detalhe', :item_patrimonio_path, only: [:show]
  add_breadcrumb 'Novo', :new_item_patrimonio_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_item_patrimonio_path, only: %i[edit update]

  respond_to :html
  def index
    @item_patrimonios = ItemPatrimonio.all.eager_load(:tipo_patrimonio, classe_patrimonio: :grupo_patrimonio)
  end

  def show; end

  def new
    @item_patrimonio = ItemPatrimonio.new
  end

  def edit; end

  def create
    @item_patrimonio = ItemPatrimonio.new(item_patrimonio_params)

    respond_to do |format|
      if @item_patrimonio.save
        format.html { redirect_to item_patrimonios_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @item_patrimonio }
      else
        format.html { render :new }
        format.json { render json: @item_patrimonio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @item_patrimonio.update(item_patrimonio_params)
      redirect_to item_patrimonios_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @item_patrimonio.destroy
        format.html { redirect_to item_patrimonios_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @item_patrimonio.errors.full_messages[0] if @item_patrimonio.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  def lista_classes_grupo
    @classes_patrimonio = ClassePatrimonio.buscar_classes_grupo(params[:grupo_patrimonio_id])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item_patrimonio
    @item_patrimonio = ItemPatrimonio.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def item_patrimonio_params
    params.require(:item_patrimonio).permit(:classe_patrimonio_id, :tipo_patrimonio_id, :codigo, :nome, :descricao)
  end
end
