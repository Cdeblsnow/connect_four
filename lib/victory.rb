require "pry-byebug"
module Victory
  def vertical_win?(player_token) # re check, I was not using node.value
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

  def horizontal_win?(player_token) # re check, I was not using node.value
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
      if node.value == player_token
        i += 1
        puts "#{node.value} : #{i}" # to be removed
      else
        i = 0
      end
      return true if i == 4
    end
    false
  end
end
