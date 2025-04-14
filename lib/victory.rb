require "pry-byebug"
module Victory
  def vertical_win?(player_token)
    i = 0
    each_vertical_node do |node|
      if node == player_token
        i += 1

      else
        i = 0
      end
      return true if i == 4
    end
    false
  end

  def horizontal_win?(player_token)
    i = 0
    each_horizontal_node do |node|
      if node == player_token
        i += 1

      else
        i = 0
      end
      return true if i == 4
    end
    false
  end

  def left_diagonal_win?(player_token)
    i = 0
    each_left_diagonal_node do |node|
      if node == player_token
        i += 1
        puts "#{node} : #{i}" # to be removed
      else
        i = 0
      end
      return true if i == 4
    end
    false
  end

  def right_diagonal_win?(player_token)
    i = 0
    each_right_diagonal_node do |node|
      if node == player_token
        i += 1
        puts "#{node} : #{i}" # to be removed
      else
        i = 0
      end
      return true if i == 4
    end
    false
  end

  def victory?(player_token)
    win = [vertical_win?(player_token), horizontal_win?(player_token),
           left_diagonal_win?(player_token), right_diagonal_win?(player_token)]
    return true if win.include?(true)

    false
  end

  def tie?
    i = 0
    @node_lists.each_value do |column|
      if column.full?
        i += 1
      else
        i = 0
      end
    end
    return true if i == 7

    false
  end
end
