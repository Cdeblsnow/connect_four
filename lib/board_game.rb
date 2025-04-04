require_relative "linkedlist"
require_relative "game"
require_relative "tokens"
require_relative "victory"

class BoardGame
  attr_accessor :node_lists # remove an change it for a getter method

  include Game
  include Tokens
  include Victory

  def initialize
    @node_lists = (1..7).to_h { |i| [i, LinkedList.new] }
    @tokens = ["\u{2648}", "\u{2649}", "\u{264A}", "\u{264B}"]
    @player_list = []
  end

  def display
    current = search_current
    puts " \n\n#{current}"
    puts "  1     2      3     4     5     6     7\n\n"
  end

  def search_current
    position = +""

    5.downto(0) do |index|
      @node_lists.each_value do |elem|
        node = elem.at(index)
        token = node.value unless node.nil?
        position << " #{token || '  '}  |"
      end
      position << "\n"
    end
    position
  end

  def redraw
    puts "\e[2J\e[H"
    display
  end

  def return_players
    @player_list
  end

  def return_columns
    @node_lists
  end
end
