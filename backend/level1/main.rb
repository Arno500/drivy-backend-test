require 'date'
require 'json'
require_relative 'models/car.rb'
require_relative 'models/rental.rb'

input_file = File.read('data/input.json')
data = JSON.parse(input_file)
cars = []
rentals = []

data['cars'].each do |car|
  cars.push(Car.new(car['id'], car['price_per_day'], car['price_per_km']))
end

output = { rentals: [] }

data['rentals'].each do |rental|
  wanted_car = cars.find { |car| car.id == rental['car_id'] }
  rentals.push(Rental.new(rental['id'], wanted_car, rental['start_date'], rental['end_date'], rental['distance']))
end

rentals.each do |rental|
  output[:rentals].push(
    id: rental.id,
    price: rental.final_price
  )
end

output_file = File.new('data/output.json', 'w')
output_file.syswrite(JSON.pretty_generate(output))
