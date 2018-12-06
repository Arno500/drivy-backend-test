class Array
   def except(value)
     self - [value]
   end
 end

class DrivyFee < Commission
  def name 
    "drivy_fee"
  end
  def calculate
    total = 0
    @current.except(self).each do |fee|
      total += fee.calculate
    end
    (@amount - total).to_i
  end
end