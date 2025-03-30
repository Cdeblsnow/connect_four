require_relative "../lib/linkedlist"

describe LinkedList do
  describe "#add_node" do
    subject(:new_node) { described_class.new(1) }
    it "adds a one new node" do
      new_node.add_node(1)
      expect(new_node.instance_variable_get(:@root).next_node).to_not be(nil)
    end

    it "adds a two new nodes" do
      new_node.add_node(1)
      new_node.add_node(2)
      my_node = new_node.instance_variable_get(:@root).next_node
      expect(my_node.next_node).to_not be(nil)
    end
  end
end
