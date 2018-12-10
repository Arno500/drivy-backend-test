require 'date'
require 'json'
require './models/car.rb'
require './models/rental.rb'
require './lib/filemanager.rb'

file_manager_instance = FileManager.new('data/input.json')
data = file_manager_instance.getData

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
  rental.add_commission(:insurance)
  rental.add_commission(:assistance)
  rental.add_commission(:drivy)
  file_manager_instance.addEntryToFile(
    id: rental.id,
    price: rental.final_price,
    commission: rental.fees
  )
end

file_manager_instance.output
