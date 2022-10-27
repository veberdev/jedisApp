class Municipe < ApplicationRecord

  validates :status, presence: true
  validates :primeiro_nome, presence: true
  validates :sobrenome, presence: true
  validates :cpf, presence: true, uniqueness: true, if: -> { cpf_valid?(cpf) }
  validates :cns, presence: true, format: {with: /\A\d+\Z/, message: "cns inválido" }, length: { is: 15 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w.+-]+@\w+\.\w+\z/, message: "email inválido" }
  validates :data_nascimento, presence: true, inclusion: { in: (Date.today - 100.years)..(Date.today), message: "data de nascimento inválida"}
  validates :telefone, presence: true, format: {with: /\A[+]{0,1}[5]{2}[1-9]{2}[9]{1}[0-9]{8}\z/, message: "telefone inválido" }, uniqueness: true

  enum status: {ativo: 0, inativo: 1}

  has_one_attached :foto
  validates :foto, presence: true

  def cpf_valid?(cpf)
    puts cpf
    if CPF.valid?(cpf) == true
      return true
    else
      errors.add(:cpf, message: "cpf inválido")
    end
  end

end
