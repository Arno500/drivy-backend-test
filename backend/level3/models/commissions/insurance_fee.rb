class InsuranceFee < Commission
  def name 
    "insurance_fee"
  end
  def calculate
    (@amount / 2).to_i
  end
end