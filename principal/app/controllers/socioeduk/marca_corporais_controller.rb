
# frozen_string_literal: true

class Socioeduk::MarcaCorporaisController < RecepcaoApplicationController
  before_action :set_socioeduk_marca_corporal, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.socioeduk_marca_corporal').pluralize, :socioeduk_marca_corporais_path
  add_breadcrumb 'Detalhe', :socioeduk_marca_corporal_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_marca_corporal_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_marca_corporal_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeduk_marca_corporais = Socioeduk::MarcaCorporal.all
  end

  def show; end

  def new
    @socioeduk_marca_corporal = Socioeduk::MarcaCorporal.new
  end

  def edit; end

  def create
    @socioeduk_marca_corporal = Socioeduk::MarcaCorporal.new(socioeduk_marca_corporal_params)

    respond_to do |format|
      if @socioeduk_marca_corporal.save
        format.html { redirect_to socioeduk_marca_corporais_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @socioeduk_marca_corporal }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_marca_corporal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_marca_corporal.update(socioeduk_marca_corporal_params)
      redirect_to socioeduk_marca_corporais_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_marca_corporal.destroy
        format.html { redirect_to socioeduk_marca_corporais_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @socioeduk_marca_corporal.errors.full_messages[0] if @socioeduk_marca_corporal.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_marca_corporal
    @socioeduk_marca_corporal = Socioeduk::MarcaCorporal.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_marca_corporal_params
    params.require(:socioeduk_marca_corporal).permit(:jovem_id, :marca_corporal_id)
  end
end
