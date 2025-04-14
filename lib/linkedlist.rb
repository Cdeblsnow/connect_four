require_relative "node"

class LinkedList
  attr_reader :head, :tail, :size

  include Enumerable
  MAX = 6

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def full?
    return true if @size == MAX

    false
  end

  def add_node(value)
    node = Node.new(value)

    if @head.nil?
      @head = node
    else
      @tail.add_next(node)

    end

    @tail = node # update the tail pointer to the latest node
    @size += 1
  end

  def at(index)
    actual_node = @head
    i = 0
    while actual_node
      return actual_node if i == index

      actual_node = actual_node.next_node
      i += 1
    end
    nil
  end
end
