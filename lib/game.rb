require_relative "player"
require "io/console"
module Game
  def initit_message
    puts "How many players will be joining?"
    puts "Please note that the default are 2 and max 4"
  end

  def player_init
    initit_message
    number_of_players = STDIN.noecho(&:gets).chomp.to_i # hides user input
    players = []

    if number_of_players < 2 || number_of_players > 4
      2.times do |i|
        puts "Please add player#{i} name"
        player_name = gets.chomp
        players << Player.new(player_name)
      end
    else
      number_of_players.times do |i|
        puts "Please add player#{i} name"
        player_name = gets.chomp
        players << Player.new(player_name)
      end
    end
    players
  end
end
