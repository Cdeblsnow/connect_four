module Tokens
  def define_player_token(player)
    puts "#{player.name} select your token"
    p @tokens
    selection = gets.chomp.to_i - 1
    player.define_token(@tokens[selection])
    @tokens.delete_at(selection)
    player.token
  end
end
