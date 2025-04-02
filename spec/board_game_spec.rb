require_relative "../lib/board_game"

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

  describe "#select_column" do
    subject(:board_column) { described_class.new }
    it "receive column number and add player token to the empty position" do
      board_column.select_column(1, "p")
      list = board_column.instance_variable_get(:@node_lists)
      expect(list[1].head.value).to eq("p")
    end

    it "receive column number and add two different player tokens to the empty positions" do
      board_column.select_column(1, "p")
      board_column.select_column(1, "f")
      list = board_column.instance_variable_get(:@node_lists)
      node = list[1].head
      expect(node.value).to eq("f") # head last element added
      expect(node.next_node.value).to eq("p") # tail first element  added
    end
  end
end
