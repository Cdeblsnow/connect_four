class Node
  attr_reader :next_node

  def initialize(token)
    @token = token
    @next_node = nil
  end

  def add_next(next_item)
    @next_node = next_item
  end
end
