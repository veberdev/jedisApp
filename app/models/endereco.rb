class Endereco < ApplicationRecord
  belongs_to :municipe

  validates :cep, presence: true
  validates :uf, presence: true
  validates :cidade, presence: true
  validates :bairro, presence: true
  validates :logradouro, presence: true

end
