class InsuranceFee < Commission
  NAME = 'insurance_fee'.freeze
  def compute
    (amount / 2).to_i
  end
end
