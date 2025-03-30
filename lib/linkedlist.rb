require_relative "node"

class LinkedList
  attr_reader :root

  include Enumerable
  MAX = 6

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def add_node(value)
    node = Node.new(value)

    if @size <= MAX
      if @head.nil?
        @head = node
        @tail = node
      else
        node.add_next(@head)
        @head = node
      end
    end

    @size += 1
  end

  def each
    actual_node = @root
    while actual_node
      yield actual_node
      actual_node = actual_node.next_node
    end
  end
end
