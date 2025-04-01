class Player
  attr_reader :name, :points, :token

  def initialize(name)
    @token = nil
    @points = 0
    @name = name
  end

  def add_point
    @points += 1
  end

  def define_token(token)
    @token = token
  end
end
