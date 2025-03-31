require_relative "linkedlist"
class BoardDisplay
  def initialize
    @node_lists = (1..7).to_h { |i| [i, LinkedList.new] }
  end

  def display
    current = search_current
    puts " \n\n#{current}"
    puts "1   2    3   4   5   6   7\n\n"
  end

  def search_current
    position = +""

    5.times do |index|
      @node_lists.each_value do |elem|
        node = elem.at(index)
        token = node.value unless node.nil?
        position << " #{token || ' '} |"
      end
      position << "\n"
    end
    position
  end
end
