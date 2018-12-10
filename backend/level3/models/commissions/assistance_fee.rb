class AssistanceFee < Commission
  NAME = 'assistance_fee'
  def calculate
    100 * @days
  end
end