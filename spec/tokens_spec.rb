require_relative "../lib/tokens"
require_relative "../lib/board_game"
require "pry-byebug"

describe Tokens do
  describe "#define_player_token" do
    subject(:player_tokens) { described_class.new }
    let(:players) { BoardDisplay.new }
    it "allow a player to select their token" do
      players_array = players.player_init
      selected_token = player_tokens.instance_variable_get(:@tokens)[0]
      allow(player_tokens).to receive(:gets).and_return("1\n")

      player_tokens.define_player_token(players_array[0])
      expect(players_array[0].token).to eq(selected_token)
    end
  end

  describe "#reset_tokens" do
    subject(:reset_tokens) { described_class.new }
    it "reset the tokens array to its original content" do
      list_of_tokens = reset_tokens.instance_variable_get(:@tokens)
      reset_tokens.instance_variable_set(:@tokens, [])
      reset_tokens.reset
      expect(reset_tokens.instance_variable_get(:@tokens)).to eq(list_of_tokens)
    end
  end
end
