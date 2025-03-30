require_relative "node"

class LinkedList
  attr_reader :root

  def initialize(column)
    @root = Node.new(column)
  end

  def add_node(token, node = @root)
    return if node.nil?

    if node.next_node.nil?

      node.add_next(Node.new(token))
    else
      add_node(token, node.next_node)
    end
  end
end
