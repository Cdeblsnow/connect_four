class Node
  attr_reader :next_node, :value

  def initialize(value)
    @value = value
    @next_node = nil
  end

  def add_next(next_item)
    @next_node = next_item
  end
end
