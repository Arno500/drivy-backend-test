class Array
   def except(value)
     self - [value]
   end
 end

class DrivyAction < Action
  NAME = 'drivy'.freeze
  TYPE = 'credit'.freeze
  def calculate
    total = 0
    @current.except(self).each do |fee|
      if (fee.class::TYPE == 'credit' && fee.class::NAME != 'owner') then
        total += fee.calculate
      end
    end
    (@amount - total).to_i
  end
end