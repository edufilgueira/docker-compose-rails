
# frozen_string_literal: true

class PatrimoniosController < PatrimonioApplicationController
  before_action :set_patrimonio, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.patrimonio').pluralize, :patrimonios_path
  add_breadcrumb 'Detalhe', :patrimonio_path, only: [:show]
  add_breadcrumb 'Novo', :new_patrimonio_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_patrimonio_path, only: %i[edit update]

  respond_to :html
  def index
    @patrimonios = Patrimonio.all.left_outer_joins(:item_patrimonio, :deposito, :area, :status_patrimonio)
  end

  def show; end

  def new
    @patrimonio = Patrimonio.new
  end

  def edit; end

  def create
    @patrimonio = Patrimonio.new(patrimonio_params)
    if !params[:deposito_id].blank?
      @patrimonio.deposito_id = params[:patrimonio][:deposito_id]
    elsif !params[:patrimonio][:area_id].blank? && params[:subarea_id].blank?
      @patrimonio.area_id = params[:patrimonio][:area_id]
    elsif !params[:patrimonio][:area_id].blank? && !params[:subarea_id].blank?
      @patrimonio.area_id = params[:subarea_id]
    end

    respond_to do |format|
      if @patrimonio.save
        format.html { redirect_to patrimonios_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @patrimonio }
      else
        flash[:error] = @patrimonio.errors.full_messages[0] if @patrimonio.errors.present?
        format.html { render :new }
        format.json { render json: @patrimonio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @patrimonio.update(patrimonio_params)
      redirect_to patrimonios_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @patrimonio.destroy
        format.html { redirect_to patrimonios_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @patrimonio.errors.full_messages[0] if @patrimonio.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  def estoque
    @patrimonios = @q.result if params[:q]
  end

  def lista_classes_grupo
    @classes_patrimonio = ClassePatrimonio.buscar_classes_grupo(params['grupo_patrimonio_id'])
  end

  def lista_itens_classe
    @itens_patrimonio = ItemPatrimonio.buscar_itens_classe(params['classe_patrimonio_id'])
  end

  def informacoes_item_patrimonio
    unless params['patrimonio'].nil?
      @item_patrimonio = ItemPatrimonio.find(params['patrimonio']['item_patrimonio_id'])
    end
  end
  
  def lista_areas
    @areas = Area.buscar_areas(params[:patrimonio][:unidade_socioeducativa_id])
  end
  
  def lista_subareas
    @subareas = Area.buscar_subareas(params[:patrimonio][:area_id])
  end
  

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_patrimonio
    @patrimonio = Patrimonio.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def patrimonio_params
    params.require(:patrimonio).permit(:tombo_anterior, :origem_anterior, :tombo_atual, :origem_atual, :status_patrimonio_id, :deposito_id, :valor, :ciclo_vida_util, :nota_fiscal, :item_patrimonio_id, :area_id, :subarea_id, :unidade_socioeducativa_id)
  end
end
