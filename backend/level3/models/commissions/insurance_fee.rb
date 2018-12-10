class InsuranceFee < Commission
  NAME = 'insurance_fee'.freeze
  def calculate
    (@amount / 2).to_i
  end
end
