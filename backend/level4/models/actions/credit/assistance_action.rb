class AssistanceAction < Action
  NAME = 'assistance'.freeze
  TYPE = 'credit'.freeze
  def calculate
    100 * @days
  end
end