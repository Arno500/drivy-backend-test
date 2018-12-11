class AssistanceFee < Commission
  NAME = 'assistance_fee'.freeze
  def compute
    100 * @days
  end
end
