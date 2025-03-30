class Player
  attr_reader :name, :points

  def initialize(name)
    @token = ""
    @points = 0
    @name = name
  end

  def add_point
    @points += 1
  end
end
