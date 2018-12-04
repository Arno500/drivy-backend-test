require 'date'
require 'json'
require './lib/filemanager.rb'
require './lib/moneymanager.rb'

fileManagerInstance = FileManager.new('data/input.json')
data = fileManagerInstance.getData

output = Hash[
    "rentals" => []
]


data["rentals"].each do |rental|
    wantedCar = data["cars"][data["cars"].index{ |x| x["id"] == rental["car_id"]}]
    numberOfDays = (Date.parse(rental["end_date"]) - Date.parse(rental["start_date"])+1).to_i
    optionsOfRental = data["options"].select{|option| option["rental_id"] == rental["id"]}

    optionsOfRentalArray = []
    optionsOfRental.each do |hash|
        optionsOfRentalArray.push(hash["type"])
    end


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
        timePrice += wantedCar["price_per_day"] * coefficient
    end

    distancePrice = rental["distance"] * wantedCar["price_per_km"]
    finalPrice = (distancePrice + timePrice).to_i

    moneyMovements = MoneyManager.new(finalPrice, numberOfDays, optionsOfRentalArray)



    fileManagerInstance.addEntryToFile({
        "id" => rental["id"],
        "options" => optionsOfRentalArray,
        "actions" => moneyMovements.outputActions
    })
end

fileManagerInstance.output()