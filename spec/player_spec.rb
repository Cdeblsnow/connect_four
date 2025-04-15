require_relative "../lib/player"

describe Player do
  describe "#add_player" do
    subject(:player_new) { described_class.new("jhon") }
    it "creates a new player" do
      expect(player_new.name).to eq("jhon")
    end
  end

  describe "#add_point" do
    subject(:player_points_increase) { described_class.new("jhon") }
    it "adds one point" do
      expect(player_points_increase.add_point).to eq(1)
    end
  end
end
