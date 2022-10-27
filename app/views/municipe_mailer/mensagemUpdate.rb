class MunicipeMailer < ApplicationMailer
  def boasVindas
    @municipe = params[:municipe]
    mail(to: @municipe.email, subject: "Prezado #{@municipe.primeiro_nome}, seja bem-vindo!")
  end

  def mensagemUpdate
    @municipe = params[:municipe]
    mail(to: @municipe.email, subject: "Prezado(a) #{@municipe.primeiro_nome}. Sua conta foi atualizada, seu status agora é #{@municipe.status}")
  end
end
