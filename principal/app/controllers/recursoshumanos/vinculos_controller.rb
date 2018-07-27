
# frozen_string_literal: true

class Recursoshumanos::VinculosController < AdminApplicationController
  before_action :set_recursoshumanos_vinculo, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.recursoshumanos_vinculo').pluralize, :recursoshumanos_vinculos_path
  add_breadcrumb 'Detalhe', :recursoshumanos_vinculo_path, only: [:show]
  add_breadcrumb 'Novo', :new_recursoshumanos_vinculo_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_recursoshumanos_vinculo_path, only: %i[edit update]

  respond_to :html
  def index
    @recursoshumanos_vinculos = Recursoshumanos::Vinculo.all
    @vinculos_group_by_tipo_legal = Recursoshumanos::Vinculo.joins(:pessoas, { recursoshumanos_cargo: { contrato: :recursoshumanos_tipo_legal } })
        .where('data_fim is NULL')
        .order('pessoas.nome')
        .group_by{|x| x.recursoshumanos_tipo_legal}
    @vinculos_desligados = Recursoshumanos::Vinculo.where('data_fim is not NULL').order(data_fim: 'DESC')
  end

  def show; end

  def new
    @recursoshumanos_vinculo = Recursoshumanos::Vinculo.new
    @lista_de_pessoas = Pessoa.sem_cargo
    @lista_de_cargos = Recursoshumanos::Cargo.com_vagas_disponiveis
  end

  def edit
    @lista_de_pessoas = [@recursoshumanos_vinculo.pessoas]
    @lista_de_cargos = [@recursoshumanos_vinculo.recursoshumanos_cargo]
  end

  def create
    @recursoshumanos_vinculo = Recursoshumanos::Vinculo.new(recursoshumanos_vinculo_params)

    respond_to do |format|
      if @recursoshumanos_vinculo.save
        format.html { redirect_to recursoshumanos_vinculos_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @recursoshumanos_vinculo }
      else
        format.html { render :new }
        format.json { render json: @recursoshumanos_vinculo.errors, status: :unprocessable_entity }
      end
    end
  end

  def desligamento
    @recursoshumanos_vinculos = Recursoshumanos::Vinculo.where(data_fim: nil)
  end

  def update
    if @recursoshumanos_vinculo.update(recursoshumanos_vinculo_params)
      redirect_to recursoshumanos_vinculos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @recursoshumanos_vinculo.update_attributes(data_fim: Date.today)
        format.html { redirect_to desligamento_recursoshumanos_vinculos_path, notice: 'Pessoa desligada com sucesso' }
      else
        flash[:error] = @recursoshumanos_vinculo.errors.full_messages[0] if @recursoshumanos_vinculo.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  def visualizar_contrato
    if !params[:cpf].blank?
      @pessoa = Pessoa.find_by_cpf(params[:cpf])
    else
      flash[:error] = "CPF em branco."
      redirect_to recursoshumanos_vinculos_path
    end
  end

  def gerar_contrato
    @pessoa = Pessoa.find_by_cpf(params[:cpf])
    @cargo = Pessoa.funcao_pessoa
    if (!params[:data_contratacao].blank?)
      @date_start = Date.strptime(params['data_contratacao'],'%d/%m/%Y')
    else
      @date_start = Date.today
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recursoshumanos_vinculo
    @recursoshumanos_vinculo = Recursoshumanos::Vinculo.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def recursoshumanos_vinculo_params
    params.require(:recursoshumanos_vinculo).permit(:data_inicio, :data_fim, :recursoshumanos_cargo_id, :pessoas_id, :cpf, :data_contratacao)
  end
end
