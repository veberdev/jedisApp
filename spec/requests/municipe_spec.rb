require "rails_helper"
include ActionDispatch::TestProcess

RSpec.describe Municipe, type: :request do
  let(:endereco) {create(:endereco)}
  let(:municipe) {create(:municipe, endereco: endereco)}


  let(:municipe_params) do
    {municipe: {
      primeiro_nome: Faker::Name.name,
      sobrenome: Faker::Name.name, 
      cpf: FFaker::IdentificationBR.cpf, 
      cns: Faker::Number.number(digits: 15).to_s, 
      email: Faker::Internet.safe_email, 
      data_nascimento: "01/01/1990",
      telefone: ["+5541997"].push(Faker::Number.number(digits: 6).to_s).join,
      foto: fixture_file_upload("app/assets/images/image.png", "image.png")
    }}
  end

  describe "GET /index" do
    it "succeeds" do
      get root_path
      expect(response).to be_successful
    end
  end

  describe "GET show" do
    it "succeeds" do
      get municipe_path(municipe)
      expect(response).to be_successful
    end
  end

  describe "POST create" do
    it "succeeds in creating a municipe" do
      expect {
        post "/municipes", params: municipe_params
      }.to change { Municipe.count }.by(1)
    end
  end
end
