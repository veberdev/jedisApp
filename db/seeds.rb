10.times do |municipe|
  municipe = Municipe.new(
    primeiro_nome: Faker::Name.name,
    sobrenome: Faker::Name.name, 
    cpf: FFaker::IdentificationBR.cpf, 
    cns: Faker::Number.number(digits: 15).to_s, 
    email: Faker::Internet.safe_email, 
    data_nascimento: "01/01/1990",
    telefone: ["+5541997"].push(Faker::Number.number(digits: 6).to_s).join
  )
  municipe.foto.attach(io: File.open("app/assets/images/image.png"), filename: 'image.png', content_type: 'image/png')
  municipe.save

  endereco = Endereco.new(
    cep: FFaker::AddressBR.zip_code,
    uf: FFaker::AddressBR.state_abbr,
    cidade: FFaker::AddressBR.city,
    bairro: FFaker::AddressBR.neighborhood,
    logradouro: FFaker::AddressBR.street,
    complemento: ["casa", "apartamento", ""].sample,
    codigo_ibge: "4106902",
    municipe: municipe
  )
  endereco.save
end
