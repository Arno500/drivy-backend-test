# Manage a rental, linked to a car
class Rental
  attr_reader :id, :car, :days, :distance
  def initialize(id, car, start_date, end_date, distance)
    @id = id
    @car = car
    @distance = distance.to_i

    @days = days_difference(start_date, end_date)
  end

  def days_difference(start_date, end_date)
    (Date.parse(start_date)..Date.parse(end_date)).count
  end

  def time_price
    @days * @car.price_per_day
  end

  def distance_price
    @distance * @car.price_per_km
  end

  def final_price
    (time_price + distance_price).to_i
  end
end
