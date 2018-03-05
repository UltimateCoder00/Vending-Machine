class ChangeCalculator
  attr_reader :change_given, :change_stored

  def initialize(change_given, change_stored)
    @change_given = change_given
    @change_stored = change_stored
  end

end
