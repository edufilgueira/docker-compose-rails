
# frozen_string_literal: true

class FuncaoPessoasController < AdminApplicationController
  before_action :set_funcao_pessoa, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.funcao_pessoa').pluralize, :funcao_pessoas_path
  add_breadcrumb 'Detalhe', :funcao_pessoa_path, only: [:show]
  add_breadcrumb 'Novo', :new_funcao_pessoa_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_funcao_pessoa_path, only: %i[edit update]

  respond_to :html
  def index
    @funcao_pessoas = FuncaoPessoa.all
  end

  def show; end

  def new
    @funcao_pessoa = FuncaoPessoa.new
  end

  def edit; end

  def create
    @funcao_pessoa = FuncaoPessoa.new(funcao_pessoa_params)

    respond_to do |format|
      if @funcao_pessoa.save
        format.html { redirect_to funcao_pessoas_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @funcao_pessoa }
      else
        format.html { render :new }
        format.json { render json: @funcao_pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @funcao_pessoa.update(funcao_pessoa_params)
      redirect_to funcao_pessoas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @funcao_pessoa.destroy
        format.html { redirect_to funcao_pessoas_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @funcao_pessoa.errors.full_messages[0] if @funcao_pessoa.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_funcao_pessoa
    @funcao_pessoa = FuncaoPessoa.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def funcao_pessoa_params
    params.require(:funcao_pessoa).permit(:funcao_id, :pessoa_id)
  end
end
