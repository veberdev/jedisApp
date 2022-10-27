class Sms
  attr_reader :municipe

  def initialize(municipe)
    @municipe = municipe
  end

  def mensagemBoasVindas
    body = "Seja bem-vindo à nossa empresa #{@municipe.primeiro_nome}. É um prazer tê-lo aqui conosco!"
    sms(body)
  end

  def mensagemUpdate
    body = "Prezado(a) #{@municipe.primeiro_nome}. Sua conta foi atualizada, seu status agora é #{@municipe.status}"
    sms(body)
  end

  private

  def sms(body)
    client = Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'], 
      ENV['TWILIO_AUTH_TOKEN'] 
    )
  
    message = client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: ENV['TO_PHONE_NUMBER'], #@municipe.telefone caso esteja com o servico pago
      body: body
    )
  end
end