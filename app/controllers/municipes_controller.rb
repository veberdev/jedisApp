class MunicipesController < ApplicationController

  def index
    @municipes = Municipe.order(:created_at).page(params[:page])
  end
  
end