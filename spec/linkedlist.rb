require_relative "../lib/linkedlist"

describe LinkedList do
  describe "#add_node" do
    subject(:new_node) { described_class.new }
    it "adds a one new node" do
      new_node.add_node(1)
      expect(new_node.instance_variable_get(:@head).value).to be(1)
    end

    it "adds a two new nodes" do
      new_node.add_node(1)
      new_node.add_node(2)
      expect(new_node.instance_variable_get(:@tail).value).to be(2)
    end
  end

  describe "#full?" do
    context "when the list size is less than six" do
      subject(:full_node) { described_class.new }
      it "returns false" do
        full_node.add_node(1)
        expect(full_node.full?).to be(false)
      end
    end

    context "when the list size is more than six" do
      subject(:full_node) { described_class.new }
      it "returns true" do
        6.times { |num| full_node.add_node(num) }
        expect(full_node.full?).to be(true)
      end
    end
  end
end
