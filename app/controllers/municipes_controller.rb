class MunicipesController < ApplicationController

  def index
    @municipes = Municipe.all
  end
  
end