#fonte: https://gist.github.com/crystianwendel/d49002f479afb4cc124bdd58da4d1e2b
#
# Classe para validação de CNS - Cartão Nacional de Saúde
#
# Lógica da validação pode ser encontrada em:
# https://integracao.esusab.ufsc.br/v211/docs/algoritmo_CNS.html
#

class Cns
  TAMANHO = 15

  def initialize(cns)
    raise ArgumentError, 'CNS deve ser uma string' unless cns.is_a?(String)

    @cns = cns
    remove_espaços!
  end

  def self.valido?(cns)
    new(cns).valido?
  end

  def valido?
    return false unless tamanho_valido?
    return false unless somente_numeros?

    case cns.chars.first
    when '1', '2'
      valida_cns
    when '7', '8', '9'
      valida_cns_provisorio
    else
      false
    end
  end

  private
  attr_reader :cns

  def remove_espaços!
    cns.gsub!(/\s+/, '')
  end

  def tamanho_valido?
    cns.length == TAMANHO
  end

  def somente_numeros?
    cns.match?(/\A\d+\Z/)
  end

  def valida_cns
    pis = cns[0...11]
    soma =
      pis.chars.each_with_index.inject(0) do |resultado, (char, i)|
        resultado += char.to_i * (TAMANHO - i)
        resultado
      end
    dv = 11 - (soma % 11)
    dv = dv == 11 ? 0 : dv
    cns_gerado = 
      if dv == 10
        soma += 2
        dv = 11 - (soma % 11)
        "#{pis}001#{dv}"
      else
        "#{pis}000#{dv}"
      end
    cns == cns_gerado
  end

  def valida_cns_provisorio
    soma =
      cns.chars.each_with_index.inject(0) do |resultado, (char, i)|
        resultado += char.to_i * (TAMANHO - i)
        resultado
      end
    (soma % 11).zero?
  end
end
