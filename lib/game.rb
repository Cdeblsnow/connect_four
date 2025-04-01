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
    players = []

    if number_of_players < 2 || number_of_players > 4
      (1..2).each do |i = 1|
        puts "Please add player#{i} name"
        player_name = gets.chomp
        players << Player.new(player_name)
      end
    else
      (1..number_of_players.length).each do |i|
        puts "Please add player#{i} name"
        player_name = gets.chomp
        players << Player.new(player_name)
      end
    end
    players
  end
end
