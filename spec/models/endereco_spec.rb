require 'rails_helper'

RSpec.describe Endereco, type: :model do
  it { should validate_presence_of(:cep) }
end
