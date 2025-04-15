require_relative "../lib/node"

describe Node do
  describe "#add_next" do
    subject(:next_n) { described_class.new("test") }
    it "adds next node" do
      next_n.add_next(6)
      expect(next_n.next_node).to eq(6)
    end
  end
end
