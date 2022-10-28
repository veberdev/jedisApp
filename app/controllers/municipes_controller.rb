class MunicipesController < ApplicationController
  before_action :definir_municipe, only: [:show, :edit, :update]

  def index
    if params_de_busca.present?
      @municipes = Municipe.filtro(params_de_busca[:campo], params_de_busca[:valor]).page(params[:page])
    else
      @municipes = Municipe.order(:created_at).page(params[:page])
    end
  end

  def new
    @municipe = Municipe.new
    @municipe.build_endereco
  end

  def create
    @municipe = Municipe.new(municipe_params)
      if @municipe.save
        MunicipeMailer.with(municipe: @municipe).boasVindas.deliver_now #user deliver_later para criar job
        Sms.new(@municipe).mensagemBoasVindas #user jobs aqui para otimizar o processo
        redirect_to root_path, notice: "Municipe criado com sucesso!"
      else
        render :new
      end
  end

  def show
  end
  
  def edit
  end

  def update
    if @municipe.save
      MunicipeMailer.with(municipe: @municipe).boasVindas.deliver_now #user deliver_later para criar job
      Sms.new(@municipe).mensagemUpdate #user jobs aqui para otimizar o processo
      redirect_to root_path, notice: "Municipe editado com sucesso!"
    else
      render :edit
    end
  end

  private

  def municipe_params
    params.require(:municipe).permit(
      :primeiro_nome, :sobrenome, :cpf, :cns, :email, :data_nascimento, :telefone, :foto, :status,
        endereco_attributes:
          [:cep, :logradouro, :complemento, :bairro, :uf, :codigo_ibge]
    )

  end

  def params_de_busca
    params.permit(:campo, :valor)
  end
  
  def definir_municipe
    @municipe = Municipe.find(params[:id])
  end
end