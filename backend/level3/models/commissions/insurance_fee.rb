class InsuranceFee < Commission
  NAME = 'insurance_fee'
  def calculate
    (@amount / 2).to_i
  end
end