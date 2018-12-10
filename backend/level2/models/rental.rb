# Manage a rental, linked to a car
class Rental
  attr_reader :id, :car, :days, :distance
  def initialize(id, car, start_date, end_date, distance)
    @id = id
    @car = car
    start_date = start_date
    end_date = end_date
    @distance = distance.to_i

    @days = (Date.parse(end_date) - Date.parse(start_date) + 1).to_i
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
end
