# Holds common properties for fees
class Commission
  attr_accessor :current
  COMMISSION_COEFF = 0.3
  def initialize(amount, distance, days, commissions)

    @amount = amount * @commission_coeff
    @distance = distance
    @days = days

    @current = commissions
  end
end

require_relative 'assistance_fee.rb'
require_relative 'insurance_fee.rb'
require_relative 'drivy_fee.rb'
