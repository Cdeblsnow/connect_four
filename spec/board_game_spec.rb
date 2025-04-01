require_relative "../lib/board_display"

describe BoardGame do
  describe "#player_init" do
    subject(:board_player) { described_class.new }
    it "create two players as default when input is 0" do
      players = board_player.player_init
      expect(players.length).to eq(2)
    end

    it "create two players as default when input is less than 2" do
      players = board_player.player_init
      expect(players.length).to eq(2)
    end

    it "create two players as default when input is more than 4" do
      players = board_player.player_init
      expect(players.length).to eq(2)
    end

    it "create three players when input is 3" do
      players = board_player.player_init
      expect(players.length).to eq(3)
    end

    it "create three players when input is 4" do
      players = board_player.player_init
      expect(players.length).to eq(4)
    end
  end

  describe "#define_player_token" do
    subject(:board_player_token) { described_class.new }
    it "permits two players to pick their token" do
      players = board_player_token.player_init
      board_player_token.define_player_token(players)
      allow($stdin).to receive(:gets).and_return("1\n")

      tokens = ["\u{2648}", "\u{2649}", "\u{264A}", "\u{264B}"]
      expect(players[1].token).to eq(tokens[1])
    end
  end
end
