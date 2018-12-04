require 'date'
require 'json'

inputFile = File.read('data/input.json')
data = JSON.parse(inputFile)

output = Hash[
    "rentals" => []
]


data["rentals"].each do |elm|
    wantedCar = data["cars"][data["cars"].index{ |x| x["id"] == elm["car_id"]}]
    dateDifference = Date.parse(elm["end_date"]) - Date.parse(elm["start_date"]) + 1

    timePrice = dateDifference.to_f * wantedCar["price_per_day"]
    distancePrice = elm["distance"] * wantedCar["price_per_km"]
    output["rentals"].push({
        "id" => elm["id"],
        "price" => (distancePrice + timePrice).to_i
    })
end

outputFile = File.new("data/output.json", "w")
outputFile.syswrite(JSON.pretty_generate(output))