FactoryBot.define do
  factory :municipe do
    status { [0, 1].sample }
    primeiro_nome { Faker::Name.name }
    sobrenome { Faker::Name.name }
    cpf { CPF.generate }
    cns { 15.times.map{rand(10)}.join }
    data_nascimento { "01/01/1990" }
    email { Faker::Internet.safe_email }
    telefone { ["+5541997"].push(Faker::Number.number(digits: 6).to_s).join }
    foto {}

    after(:build) do |municipe|
	    municipe.foto.attach(io: File.open("app/assets/images/image.png"),
				  filename: 'image.png',
			    content_type: 'image/png'
		         )
     end
  end
end
