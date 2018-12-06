# Holds common properties for fees
class Commission
  attr_accessor :current
  def initialize(amount, distance, days, commissions)
    @commission_coeff = 0.3

    @amount = amount * @commission_coeff
    @distance = distance
    @days = days

    @current = commissions
  end
end

require_relative 'assistance_fee.rb'
require_relative 'insurance_fee.rb'
require_relative 'drivy_fee.rb'
