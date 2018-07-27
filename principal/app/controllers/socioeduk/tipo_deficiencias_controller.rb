
# frozen_string_literal: true

class Socioeduk::TipoDeficienciasController < RecepcaoApplicationController
  before_action :set_socioeduk_tipo_deficiencia, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.socioeduk_tipo_deficiencia').pluralize, :socioeduk_tipo_deficiencias_path
  add_breadcrumb 'Detalhe', :socioeduk_tipo_deficiencia_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_tipo_deficiencia_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_tipo_deficiencia_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeduk_tipo_deficiencias = Socioeduk::TipoDeficiencia.all
  end

  def show; end

  def new
    @socioeduk_tipo_deficiencia = Socioeduk::TipoDeficiencia.new
  end

  def edit; end

  def create
    @socioeduk_tipo_deficiencia = Socioeduk::TipoDeficiencia.new(socioeduk_tipo_deficiencia_params)

    respond_to do |format|
      if @socioeduk_tipo_deficiencia.save
        format.html { redirect_to socioeduk_tipo_deficiencias_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @socioeduk_tipo_deficiencia }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_tipo_deficiencia.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_tipo_deficiencia.update(socioeduk_tipo_deficiencia_params)
      redirect_to socioeduk_tipo_deficiencias_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_tipo_deficiencia.destroy
        format.html { redirect_to socioeduk_tipo_deficiencias_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @socioeduk_tipo_deficiencia.errors.full_messages[0] if @socioeduk_tipo_deficiencia.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_tipo_deficiencia
    @socioeduk_tipo_deficiencia = Socioeduk::TipoDeficiencia.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_tipo_deficiencia_params
    params.require(:socioeduk_tipo_deficiencia).permit(:descricao)
  end
end
