
# frozen_string_literal: true

class Socioeduk::InfracaoPreliminaresController < RecepcaoApplicationController
  before_action :set_socioeduk_infracao_preliminar, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.socioeduk_infracao_preliminar').pluralize, :socioeduk_infracao_preliminares_path
  add_breadcrumb 'Detalhe', :socioeduk_infracao_preliminar_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_infracao_preliminar_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_infracao_preliminar_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeduk_infracao_preliminares = Socioeduk::InfracaoPreliminar.all
  end

  def show; end

  def new
    @socioeduk_infracao_preliminar = Socioeduk::InfracaoPreliminar.new
  end

  def edit; end

  def create
    @socioeduk_infracao_preliminar = Socioeduk::InfracaoPreliminar.new(socioeduk_infracao_preliminar_params)

    respond_to do |format|
      if @socioeduk_infracao_preliminar.save
        format.html { redirect_to socioeduk_infracao_preliminares_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @socioeduk_infracao_preliminar }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_infracao_preliminar.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_infracao_preliminar.update(socioeduk_infracao_preliminar_params)
      redirect_to socioeduk_infracao_preliminares_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_infracao_preliminar.destroy
        format.html { redirect_to socioeduk_infracao_preliminares_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @socioeduk_infracao_preliminar.errors.full_messages[0] if @socioeduk_infracao_preliminar.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_infracao_preliminar
    @socioeduk_infracao_preliminar = Socioeduk::InfracaoPreliminar.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_infracao_preliminar_params
    params.require(:socioeduk_infracao_preliminar).permit(:atendimento_inicial_id, :tipo_infracao_id)
  end
end
