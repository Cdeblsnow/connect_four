class Tokens
  def initialize
    @tokens = ["\u{2648}", "\u{2649}", "\u{264A}", "\u{264B}"]
  end

  def define_player_token(player)
    puts "#{player.name} select your token"
    selection = gets.chomp.to_i - 1
    player.define_token(@tokens[selection])
    @tokens.delete_at(selection)
    player.token
  end

  def reset
    @tokens = ["\u{2648}", "\u{2649}", "\u{264A}", "\u{264B}"]
  end
end
