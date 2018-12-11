class DrivyFee < Commission
  NAME = 'drivy_fee'.freeze
  def compute
    total = 0
    all_fees = @current.reject{ |commission| commission == self}.map(&:compute)
    (amount - all_fees.sum).to_i
  end
end
