# Holds common properties for fees
class Commission
  attr_accessor :current
  COMMISSION_COEFF = 0.3.freeze
  def initialize(paid, distance, days, commissions)

    @paid = paid 
    @distance = distance
    @days = days

    @current = commissions
  end

  def amount
    @paid * COMMISSION_COEFF
  end
end

require_relative 'assistance_fee.rb'
require_relative 'insurance_fee.rb'
require_relative 'drivy_fee.rb'
