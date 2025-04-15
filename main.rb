require_relative "lib/board_game"
require_relative "lib/player"
require_relative "lib/linkedlist"
require_relative "lib/tokens"

board = BoardGame.new
board.welcome
board.set_number_of_players
players = board.return_players
players.each { |player| board.define_player_token(player) }
board.show_list_of_players
board.display

i = 0
loop do # rubocop:disable Metrics/BlockLength
  current_player = players[i % players.length] # loop trough every player
  puts <<~HEREDOC

    It is #{current_player.name} turn!

    Please select the column where you want to insert your token.

  HEREDOC
  input = gets.chomp.to_i
  board.select_column(input, current_player.token)
  board.redraw
  if board.victory?(current_player.token)
    board.congratulations(current_player.name)
    puts "Would you like to keep playing? Y/N"
    answer = gets.chomp.downcase
    case answer
    when "y"
      board.reset_columns
      board.redraw
    when "n"
      board.thanks
      break
    end
  end
  if board.tie?
    board.tie_message
    puts "Would you like to keep playing? Y/N"
    answer = gets.chomp.downcase
    case answer
    when "y"
      board.reset_columns
      board.redraw
    when "n"
      board.thanks
      break
    end
  end

  i += 1
end
