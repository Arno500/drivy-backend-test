# Manage a car, with its prices
class Car
  attr_reader :id, :price_per_day, :price_per_km
  def initialize(id, price_per_day, price_per_km)
    @id = id
    @price_per_day = price_per_day.to_i
    @price_per_km = price_per_km.to_i
  end
end
