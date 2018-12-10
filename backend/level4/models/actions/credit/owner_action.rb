class OwnerAction < Action
  NAME = 'owner'.freeze
  TYPE = 'credit'.freeze
  def calculate
    (@orig_price - @amount).to_i
  end
end