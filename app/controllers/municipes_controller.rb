class MunicipesController < ApplicationController

  def index
    if params_de_busca.present?
      @municipes = Municipe.filtro(params_de_busca[:campo], params_de_busca[:valor]).page(params[:page])
    else
      @municipes = Municipe.order(:created_at).page(params[:page])
    end
  end
  
  private

  def params_de_busca
    params.permit(:campo, :valor)
  end

end