FactoryBot.define do
  factory :endereco do
    cep { "81110000" }
    uf { ["PR", "SC", "SP"].sample }
    cidade { "Curitiba" }
    bairro { "Centro" }
    logradouro { "Joao da esquina" }
    complemento { "casa" }
    codigo_ibge { "1111111" }
    municipe { nil }
  end
end
