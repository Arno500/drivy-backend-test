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
    @days * @car.price_per_day
  end

  # Erreur ici
  def distance_price
    @distance * @car.price_per_km
  end

  def final_price
    (time_price + distance_price).to_i
  end
end
