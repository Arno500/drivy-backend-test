class Array
  def except(value)
    self - [value]
  end
end

class DrivyFee < Commission
  NAME = 'drivy_fee'.freeze
  def calculate
    total = 0
    @current.except(self).each do |fee|
      total += fee.calculate
    end
    (amount - total).to_i
  end
end