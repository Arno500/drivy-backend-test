class AssistanceFee < Commission
  NAME = 'assistance_fee'.freeze
  def calculate
    100 * @days
  end
end