class AssistanceFee < Commission
  def name 
    "assistance_fee"
  end
  def calculate
    100 * @days
  end
end