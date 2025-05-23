require_relative "linkedlist"
require_relative "game"
require_relative "tokens"
require_relative "victory"

# Display, search, redraw, add node, and the creation of columns come from XAJX179 project
# You can check their work on https://github.com/XAJX179/Connect-four

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

  def reset_columns
    @node_lists = (1..7).to_h { |i| [i, LinkedList.new] }
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

  def each_vertical_node
    @node_lists.each_value do |elem|
      5.downto(0) do |index|
        node = elem.at(index).value unless elem.at(index).nil?
        yield node
      end
    end
  end

  def each_horizontal_node
    5.downto(0) do |index|
      @node_lists.each_value do |elem|
        node = elem.at(index).value unless elem.at(index).nil?
        yield node
      end
    end
  end

  def each_left_diagonal_node
    (1..4).each do |column|
      (3..5).each do |row|
        4.times do |i|
          col = column + i
          r = row - i
          node = @node_lists[col].at(r)
          break if node.nil?

          yield node.value
        end
      end
    end
  end

  def each_right_diagonal_node
    (1..4).each do |column|
      (0..2).each do |row|
        4.times do |i|
          col = column + i
          r = row + i
          node = @node_lists[col].at(r)
          break if node.nil?

          yield node.value
        end
      end
    end
  end
end
