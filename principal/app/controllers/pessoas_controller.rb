
# frozen_string_literal: true

class PessoasController < AdminApplicationController
  before_action :set_pessoa, only: %i[show edit update destroy]
  add_breadcrumb 'Pessoas', :pessoas_path
  add_breadcrumb 'Detalhe', :pessoa_path, only: [:show]
  add_breadcrumb 'Novo', :new_pessoa_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_pessoa_path, only: %i[edit update]

  respond_to :html
  def index
    @pessoas = Pessoa.all
  end

  def show; end

  def new
    @pessoa = Pessoa.new
  end

  def edit; end

  def create
    @pessoa = Pessoa.new(pessoa_params)

    respond_to do |format|
      if @pessoa.save
        format.html { redirect_to new_recursoshumanos_vinculo_url(pessoa_id: @pessoa.id), notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @pessoa }
      else
        format.html { render :new }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @pessoa.update(pessoa_params)
      redirect_to pessoas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @pessoa.destroy
        format.html { redirect_to pessoas_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @pessoa.errors.full_messages[0] if @pessoa.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  def contratacao
    @pessoa = Pessoa.new
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pessoa
    @pessoa = Pessoa.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def pessoa_params
    params.require(:pessoa).permit(:nome, :data_contratacao, :cpf, :usuario_id, :email_pessoal, :nome_pai, :nome_mae, :estado_civil, :conjuge, :profissao, :data_nascimento, :naturalidade, :uf, :tipo_sanguineo, :sexo, :rua, :numero, :complemento, :bairro, :cidade, :estado, :cep, :cep, :telefone, :celular, :pis, :ctps, :serie, :rg, :emissor, :emissao, :certificado_militar, :emissor_militar, :titulo_eleitoral, :zona, :secao, :banco, :agencia, :conta_corrente)
    end
    end
