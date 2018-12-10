class InsuranceAction < Action
  NAME = 'insurance'.freeze
  TYPE = 'credit'.freeze
  def calculate
    (@amount / 2).to_i
  end
end