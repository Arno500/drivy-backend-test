# Holds common properties for fees
class Action
  attr_accessor :current
  def initialize(amount, distance, days, commissions)
    @commission_coeff = 0.3

    @orig_price = amount
    @amount = amount * @commission_coeff
    @distance = distance
    @days = days

    @current = commissions
  end
end

require_relative 'debit/driver_action.rb'
require_relative 'credit/owner_action.rb'
require_relative 'credit/assistance_action.rb'
require_relative 'credit/insurance_action.rb'
require_relative 'credit/drivy_action.rb'
