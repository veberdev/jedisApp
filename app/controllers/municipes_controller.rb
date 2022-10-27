class MunicipesController < ApplicationController

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
        redirect_to root_path, notice: "Municipe criado com sucesso!"
      else
        render :new
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

end