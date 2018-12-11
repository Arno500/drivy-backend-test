require 'date'
require 'json'
require './lib/filemanager.rb'

fileManagerInstance = FileManager.new('data/input.json')
data = fileManagerInstance.getData

output = Hash[
    'rentals' => []
]


data['rentals'].each do |elm|
    wantedCar = data['cars'][data['cars'].index{ |x| x['id'] == elm['car_id']}]
    numberOfDays = Date.parse(elm['end_date']) - Date.parse(elm['start_date'])+1


    timePrice = 0
    for x in 0..numberOfDays-1
        if x >= 1 && x < 4
            coefficient = 0.9
        elsif x >= 4 && x < 10
            coefficient = 0.7
        elsif x >= 10
            coefficient = 0.5
        else
            coefficient = 1
        end 
        timePrice += wantedCar['price_per_day'] * coefficient
    end

    distancePrice = elm['distance'] * wantedCar['price_per_km']
    fileManagerInstance.addEntryToFile({
        'id' => elm['id'],
        'price' => (distancePrice + timePrice).to_i
    })
end

fileManagerInstance.output()