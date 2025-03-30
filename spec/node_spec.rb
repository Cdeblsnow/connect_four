require_relative "../lib/node"

describe Node do
  describe "#add_next" do
    subject(:next_n) { described_class.new }
    it "adds next node" do
      next_n.add_next(6)
      expect(next_n.next_node).to eq(6)
    end
  end

  describe "#add_next" do
    subject(:node_value) { described_class.new }
    it "adds value to the current node" do
      node_value.add_value(6)
      expect(node_value.value).to eq(6)
    end
  end
end
