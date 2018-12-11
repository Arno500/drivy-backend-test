require 'date'
require 'json'
require_relative 'models/car.rb'
require_relative 'models/rental.rb'
require_relative 'lib/filemanager.rb'

file_manager_instance = FileManager.new('data/input.json')
data = file_manager_instance.get_data

cars = []
rentals = []

data['cars'].each do |car|
  cars.push(Car.new(car['id'], car['price_per_day'], car['price_per_km']))
end

data['rentals'].each do |rental|
  wanted_car = cars.find { |car| car.id == rental['car_id'] }
  rentals.push(Rental.new(rental['id'], wanted_car, rental['start_date'], rental['end_date'], rental['distance']))
end

rentals.each do |rental|
  file_manager_instance.add_entry_to_file(
    id: rental.id,
    price: rental.final_price
  )
end

file_manager_instance.output
