class MoneyManager
    def initialize(paidByClient, numberOfDays=1)
        @paidByClient = paidByClient.to_i
        @commissionCoeff = 0.3
        insuranceCoeff = 0.5
        assistanceFee = 1

        @commissionTotal = paidByClient * @commissionCoeff
        @insuranceFeeHere = (@commissionTotal / 2).to_i
        @assistanceFeeHere = assistanceFee * 100 * numberOfDays
        @whatWeKeepHere = (@commissionTotal - (@insuranceFeeHere + @assistanceFeeHere)).to_i
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
        return {
            "who" => "drivy",
            "type" => "credit",
            "amount" => @whatWeKeepHere
        }
    end

    def getOwnerEarning
        return {
            "who" => "owner",
            "type" => "credit",
            "amount" => (@paidByClient * (1 - @commissionCoeff)).to_i
        }
    end

    def getDriverSpending
        return {
            "who" => "driver",
            "type" => "debit",
            "amount" => @paidByClient
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