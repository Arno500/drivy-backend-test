class DriverAction < Action
  NAME = 'driver'.freeze
  TYPE = 'debit'.freeze
  def calculate
    @orig_price.to_i
  end
end