
# frozen_string_literal: true

class Socioeduk::OpcaoSexuaisController < RecepcaoApplicationController
  before_action :set_socioeduk_opcao_sexual, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.socioeduk_opcao_sexual').pluralize, :socioeduk_opcao_sexuais_path
  add_breadcrumb 'Detalhe', :socioeduk_opcao_sexual_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_opcao_sexual_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_opcao_sexual_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeduk_opcao_sexuais = Socioeduk::OpcaoSexual.all
  end

  def show; end

  def new
    @socioeduk_opcao_sexual = Socioeduk::OpcaoSexual.new
  end

  def edit; end

  def create
    @socioeduk_opcao_sexual = Socioeduk::OpcaoSexual.new(socioeduk_opcao_sexual_params)

    respond_to do |format|
      if @socioeduk_opcao_sexual.save
        format.html { redirect_to socioeduk_opcao_sexuais_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @socioeduk_opcao_sexual }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_opcao_sexual.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_opcao_sexual.update(socioeduk_opcao_sexual_params)
      redirect_to socioeduk_opcao_sexuais_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_opcao_sexual.destroy
        format.html { redirect_to socioeduk_opcao_sexuais_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @socioeduk_opcao_sexual.errors.full_messages[0] if @socioeduk_opcao_sexual.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_opcao_sexual
    @socioeduk_opcao_sexual = Socioeduk::OpcaoSexual.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_opcao_sexual_params
    params.require(:socioeduk_opcao_sexual).permit(:descricao)
  end
end
