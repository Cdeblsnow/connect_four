require_relative "../lib/board_game"

describe BoardGame do # rubocop:disable Metrics/BlockLength
  describe "#player_init" do
    subject(:board_player) { described_class.new }
    let(:player_list) { board_player.instance_variable_get(:@player_list) }
    it "create two players as default when input is 0" do
      board_player.player_init(0)
      expect(player_list.length).to eq(2)
    end

    it "create two players as default when input is less than 2" do
      board_player.player_init(1)
      expect(player_list.length).to eq(2)
    end

    it "create two players as default when input is more than 4" do
      board_player.player_init(5)
      expect(player_list.length).to eq(2)
    end

    it "create three players when input is 3" do
      board_player.player_init(3)
      puts player_list.length
      expect(player_list.length).to eq(3)
    end

    it "create four players when input is 4" do
      board_player.player_init(4)
      expect(player_list.length).to eq(4)
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
      expect(node.value).to eq("p") # head first element added
      expect(node.next_node.value).to eq("f") # tail last element  added
    end
  end

  context "testing Victory module" do
    describe "#vertical_win?" do
      subject(:vertical_win) { described_class.new }
      let(:columns) { vertical_win.instance_variable_get(:@node_lists) }
      it "returns true when there is four in a column" do
        token = "p"
        columns.each do |key, content|
          content.add_node("c") if key == 1
          4.times { |i| content.add_node(token) } if key == 1 # rubocop:disable Lint/UnusedBlockArgument
        end
        expect(vertical_win.vertical_win?(token)).to eq(true)
      end
    end

    describe "#horizontal_win?" do
      subject(:horizontal_win) { described_class.new }
      let(:columns) { horizontal_win.instance_variable_get(:@node_lists) }
      it "returns true when there is four in a row" do
        token = "p"
        columns.each_value do |content|
          content.add_node("c")
          content.add_node(token)
        end
        expect(horizontal_win.horizontal_win?(token)).to eq(true)
      end
    end
  end

  describe "#left_diagonal_win?" do
    subject(:diagonal) { described_class.new }
    let(:columns) { diagonal.instance_variable_get(:@node_lists) }
    it "returns true when there are four of the same token in a diagonal" do
      token = "t"
      index = 0
      columns.each_value do |content|
        4.times do |i|
          content.add_node(token) if i == (4 - index)
          content.add_node("c") if i < 4
        end
        index += 1 if index < 5
      end
      expect(diagonal.left_diagonal_win?(token)).to eq(true)
    end
  end

  describe "#right_diagonal_win?" do
    subject(:diagonal) { described_class.new }
    let(:columns) { diagonal.instance_variable_get(:@node_lists) }
    it "returns true when there are four of the same token in a diagonal" do
      token = "t"
      index = 4
      columns.each_value do |content|
        4.times do |i|
          content.add_node(token) if i == (4 - index)
          content.add_node("c") if i < 4
        end
        index -= 1 if index < 5
      end
      expect(diagonal.right_diagonal_win?(token)).to eq(true)
    end
  end

  describe "#victory?" do # rubocop:disable Metrics/BlockLength
    subject(:board_victory) { described_class.new }
    let(:columns) { board_victory.instance_variable_get(:@node_lists) }
    it "return true for vertical win" do
      token = "p"
      columns.each do |key, content|
        content.add_node("c") if key == 1
        4.times { |i| content.add_node(token) } if key == 1 # rubocop:disable Lint/UnusedBlockArgument
      end
      expect(board_victory.victory?(token)).to eq(true)
    end

    it "returns true for horizontal win" do
      token = "p"
      columns.each_value do |content|
        content.add_node("c")
        content.add_node(token)
      end
      expect(board_victory.victory?(token)).to eq(true)
    end

    it "returns true for left diagonal win" do
      token = "t"
      index = 0
      columns.each_value do |content|
        4.times do |i|
          content.add_node(token) if i == (4 - index)
          content.add_node("c") if i < 4
        end
        index += 1 if index < 5
      end
      expect(board_victory.victory?(token)).to eq(true)
    end

    it "returns true for right diagonal win" do
      token = "t"
      index = 4
      columns.each_value do |content|
        4.times do |i|
          content.add_node(token) if i == (4 - index)
          content.add_node("c") if i < 4
        end
        index -= 1 if index < 5
      end
      expect(board_victory.victory?(token)).to eq(true)
    end
  end

  describe "#tie?" do
    subject(:board_tie) { described_class.new }
    let(:columns) { board_tie.instance_variable_get(:@node_lists) }
    it "returns true when all columns are full" do
      token = "p"
      columns.each_value do |content|
        6.times { content.add_node(token) }
      end
      expect(board_tie.tie?).to eq(true)
    end
  end

  describe "#reset_columns" do
    subject(:board_reset_col) { described_class.new }
    it "empty all columns" do
      columns = board_reset_col.return_columns
      token = "p"
      columns.each_value do |content|
        6.times { content.add_node(token) }
      end

      board_reset_col.reset_columns
      columns = board_reset_col.return_columns # refresh the object reference
      columns.each_value do |content|
        expect(content.size).to eq(0)
      end
    end
  end
end
