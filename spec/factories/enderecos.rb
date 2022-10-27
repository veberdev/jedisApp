FactoryBot.define do
  factory :endereco do
    cep { FFaker::AddressBR.zip_code }
    uf { FFaker::AddressBR.state_abbr }
    cidade { FFaker::AddressBR.city }
    bairro { FFaker::AddressBR.neighborhood }
    logradouro { FFaker::AddressBR.street }
    complemento { ["casa", "apartamento", ""].sample }
    codigo_ibge { "4106902" }
    municipe
  end
end
