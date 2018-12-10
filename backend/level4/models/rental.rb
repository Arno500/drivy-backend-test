require_relative 'actions/action.rb'

# Manage a rental, linked to a car
class Rental
  attr_reader :id, :car, :days, :distance
  attr_accessor :commissions
  def initialize(id, car, start_date, end_date, distance)
    @id = id
    @car = car
    start_date = start_date
    end_date = end_date
    @days = (Date.parse(end_date) - Date.parse(start_date) + 1).to_i
    @distance = distance.to_i

    @commissions = []
    @commission_types = {
      insurance: InsuranceAction,
      assistance: AssistanceAction,
      drivy: DrivyAction,
      owner: OwnerAction,
      driver: DriverAction
    }
  end

  def time_price
    time_price = 0
    (0..@days - 1).each do |x|
      coefficient = if x >= 1 && x < 4 then 0.9
                    elsif x >= 4 && x < 10 then 0.7
                    elsif x >= 10 then 0.5
                    else 1
                    end
      time_price += @car.price_per_day * coefficient
    end
    time_price
  end

  def distance_price
    @distance * @car.price_per_km
  end

  def final_price
    (time_price + distance_price).to_i
  end

  def add_commission(type)
    @commissions.push(@commission_types[type].new(final_price, distance, days, @commissions))
  end

  def fees
    commissions_output = []
    @commissions.each do |commission|
      commissions_output.push({
          who: commission.class::NAME,
          type: commission.class::TYPE,
          amount: commission.calculate
        })
    end
    commissions_output
  end
end
