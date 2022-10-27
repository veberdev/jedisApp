FactoryBot.define do
  factory :municipe do
    status { [0, 1].sample }
    primeiro_nome { Faker::Name.name }
    sobrenome { Faker::Name.name }
    cpf { CPF.generate }
    cns { 15.times.map{rand(10)}.join }
    data_nascimento { "01/01/1990" }
    email { Faker::Internet.safe_email }
    telefone { [55419].push(8.times.map{rand(10)}).join }
  end
end