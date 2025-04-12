require_relative "player"
require "io/console"
module Game
  def welcome
    puts <<~HEREDOC

      Welcome to connect four!

      Rules are very simple:
      1. Try to put four of your tokens forming a line in any direction to win
      2. At least two players must play at a time

      Good luck!

    HEREDOC
  end

  def initit_message
    puts "How many players will be joining?"
    puts "Please note that the default are 2 and max 4"
  end

  def set_number_of_players
    initit_message
    number_of_players = STDIN.noecho(&:gets).chomp.to_i # hides user input
    player_init(number_of_players)
  end

  def player_init(number_of_players = 0)
    if number_of_players < 2 || number_of_players > 4
      (1..2).each do |i = 1|
        puts "Please add player#{i} name"
        player_name = gets.chomp
        @player_list << Player.new(player_name)
      end
    else
      (1..number_of_players).each do |i|
        puts "Please add player#{i} name"
        player_name = gets.chomp
        @player_list << Player.new(player_name)
      end
    end
    @player_list
  end

  def show_list_of_players
    @player_list.each do |player|
      puts "Payer: #{player.name} mark: #{player.token}"
    end
  end

  def select_column(column, player_token) # needs testing
    @node_lists.each do |key, content|
      content.add_node(player_token) if key == column
    end
  end

  def congratulations(winner)
    puts <<~HEREDOC

      Congratulations#{winner} for winning!

      The game ends with the following score:
    HEREDOC
    @player_list.each do |player|
      puts "Payer: #{player.name} points: #{player.points}"
    end
  end
end
