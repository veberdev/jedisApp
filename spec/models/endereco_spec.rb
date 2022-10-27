require 'rails_helper'

RSpec.describe Endereco, type: :model do
  it { should validate_presence_of(:cep) }
  it { should validate_presence_of(:uf) }
  it { should validate_presence_of(:cidade) }
  it { should validate_presence_of(:bairro) }
  it { should validate_presence_of(:logradouro) }

  it { should belong_to(:municipe) }

  let(:endereco) { build(:endereco) }

  it "factory endereco funcionando" do
    expect(endereco).to be_valid
  end

  it "invalido sem cep" do
    endereco.cep = nil

    expect(endereco).to_not be_valid
  end

  it "invalido sem uf" do
    endereco.uf = nil

    expect(endereco).to_not be_valid
  end

  it "invalido sem cidade" do
    endereco.cidade = nil

    expect(endereco).to_not be_valid
  end

  it "invalido sem bairro" do
    endereco.bairro = nil

    expect(endereco).to_not be_valid
  end

  it "invalido sem logradouro" do
    endereco.logradouro = nil

    expect(endereco).to_not be_valid
  end

end
