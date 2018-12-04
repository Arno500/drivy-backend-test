class MoneyManager
    def initialize(paidByClient, numberOfDays = 1, options = [])
        #Settings
        @paidByClient = paidByClient.to_i
        @options = options
        @commissionCoeff = 0.3
        insuranceCoeff = 0.5
        assistanceFee = 1


        #Commision section
        @commissionTotal = paidByClient * @commissionCoeff
        @insuranceFeeHere = (@commissionTotal / 2).to_i
        @assistanceFeeHere = assistanceFee * 100 * numberOfDays
        @whatWeKeepHere = (@commissionTotal - (@insuranceFeeHere + @assistanceFeeHere)).to_i

        #Options
        @ownerOptions = (500 * @options.count("gps")) + (200 * @options.count("baby_seat"))
        @drivyOptions = (1000 * @options.count("additional_insurance") * numberOfDays)
    end

    def getInsurance
        return {
            "who" => "insurance",
            "type" => "credit",
            "amount" => @insuranceFeeHere
        }
    end

    def getAssistance
        return {
            "who" => "assistance",
            "type" => "credit",
            "amount" => @assistanceFeeHere
        }
    end
    
    def getWhatWeKeep
        drivyEarnings = @whatWeKeepHere + @drivyOptions
        return {
            "who" => "drivy",
            "type" => "credit",
            "amount" => drivyEarnings
        }
    end

    def getOwnerEarning
        ownerEarning = (@paidByClient * (1 - @commissionCoeff) + @ownerOptions).to_i
        return {
            "who" => "owner",
            "type" => "credit",
            "amount" => ownerEarning
        }
    end

    def getDriverSpending
        return {
            "who" => "driver",
            "type" => "debit",
            "amount" => @paidByClient + @ownerOptions + @drivyOptions
        }
    end

    def outputActions
        return [
            getDriverSpending,
            getOwnerEarning,
            getInsurance,
            getAssistance,
            getWhatWeKeep
        ]
    end

end