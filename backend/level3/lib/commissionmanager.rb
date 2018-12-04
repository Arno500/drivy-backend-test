class CommissionManager
    def initialize(paidByClient, numberOfDays=1)
        commissionCoeff = 0.3
        insuranceCoeff = 0.5
        assistanceFee = 1

        @commissionTotal = paidByClient * commissionCoeff
        @insuranceFeeHere = (@commissionTotal / 2).to_i
        @assistanceFeeHere = assistanceFee * 100 * numberOfDays
        @whatWeKeepHere = (@commissionTotal - (@insuranceFeeHere + @assistanceFeeHere)).to_i
    end

    def getInsurance
        return @insuranceFeeHere
    end

    def getAssistance
        return @assistanceFeeHere
    end
    
    def getWhatWeKeep
        return @whatWeKeepHere
    end

end