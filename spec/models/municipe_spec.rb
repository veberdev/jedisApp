require 'rails_helper'

RSpec.describe Municipe, type: :model do
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:primeiro_nome) }
  it { should validate_presence_of(:sobrenome) }
  it { should validate_presence_of(:cpf) }
  it { should validate_presence_of(:cns) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:data_nascimento) }
  it { should validate_presence_of(:telefone) }
  it { should validate_length_of(:cns).is_equal_to(15)}

  let(:municipe) { build(:municipe) }

  it "factory municipe funcionando" do
    expect(municipe).to be_valid
  end

  it "invalido sem nome" do
    municipe.primeiro_nome = nil

    expect(municipe).to_not be_valid
  end

  it "invalido sem sobrenome" do
    municipe.sobrenome = nil

    expect(municipe).to_not be_valid
  end

  it "invalido sem cpf" do
    municipe.cpf = nil

    expect(municipe).to_not be_valid
  end

  it "invalido cpf errado" do
    municipe.cpf = 123

    expect(municipe).to_not be_valid
  end

  it "valido cpf formato string" do
    municipe.cpf = "590.426.820-35"

    expect(municipe).to be_valid
  end

  it "valido cpf formato integer" do
    municipe.cpf = 59042682035

    expect(municipe).to be_valid
  end

  it "invalido cpf formato" do
    municipe.cpf = 11111111111

    expect(municipe).to_not be_valid
  end

  it "invalido sem cns" do
    municipe.cns = nil

    expect(municipe).to_not be_valid
  end

  it "invalido sem email" do
    municipe.email = nil

    expect(municipe).to_not be_valid
  end

  it "invalido formato email" do
    municipe.email = "asd@as.2.123"

    expect(municipe).to_not be_valid
  end

  it "valido formato email" do
    municipe.email = "abc@abc.com"

    expect(municipe).to be_valid
  end

  it "invalido sem data_nascimento" do
    municipe.data_nascimento = nil

    expect(municipe).to_not be_valid
  end

  it "invalido data_nascimento fora do range" do
    municipe.data_nascimento = "01/01/1800"

    expect(municipe).to_not be_valid
  end

  it "invalido data_nascimento fora do range" do
    municipe.data_nascimento = "01/01/2100"

    expect(municipe).to_not be_valid
  end

  it "invalido sem telefone" do
    municipe.telefone = nil

    expect(municipe).to_not be_valid
  end

  it "invalido formato telefone" do
    municipe.telefone = "912345678"

    expect(municipe).to_not be_valid
  end

  it "valido telefone formato com o +" do
    municipe.telefone = "+5541912345678"

    expect(municipe).to be_valid
  end

  it "valido telefone formato sem o +" do
    municipe.telefone = "+5541912345678"

    expect(municipe).to be_valid
  end

  it "invalido sem foto" do
    municipe.foto = nil

    expect(municipe).to_not be_valid
  end
end
