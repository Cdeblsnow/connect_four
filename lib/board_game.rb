require_relative "linkedlist"
require_relative "game"

class BoardGame
  attr_accessor :node_lists # remove an change it for a getter method

  include Game

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

    5.downto(0) do |index|
      @node_lists.each_value do |elem|
        node = elem.at(index)
        token = node.value unless node.nil?
        position << " #{token || ' '} |"
      end
      position << "\n"
    end
    position
  end

  def redraw
    puts "\e[2J\e[H"
    display
  end
end
