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
    prices = (0..@days - 1).map do |x|
      @car.price_per_day * time_coefficient(x)
    end
    prices.sum
  end

  STEP = [1,4,10].freeze
  COEFFICIENT = [0.9,0.7,0.5].freeze
  def time_coefficient(day_number)
    coefficient = if day_number >= STEP[0] && day_number < STEP[1] then COEFFICIENT[0]
                  elsif day_number >= STEP[1] && day_number < STEP[2] then COEFFICIENT[1]
                  elsif day_number >= STEP[2] then COEFFICIENT[2]
                  else 1
                  end
    coefficient
  end

  def distance_price
    @distance * @car.price_per_km
  end

  def final_price
    (time_price + distance_price).to_i
  end
end
