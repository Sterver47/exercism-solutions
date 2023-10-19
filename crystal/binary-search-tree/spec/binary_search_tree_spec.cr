require "spec"
require "../src/*"

describe "BinarySearchTree" do
  it "data is retained" do
    tree = Node.new(4)
    tree.value.should eq(4)
  end

  it "smaller number at left node" do
    tree = Node.new(4)
    tree.insert(2)
    tree.value.should eq(4)
    left = tree.left.not_nil!
    left.value.should eq(2)
  end

  it "same number at left node" do
    tree = Node.new(4)
    tree.insert(4)
    tree.value.should eq(4)
    left = tree.left.not_nil!
    left.value.should eq(4)
  end

  it "greater number at right node" do
    tree = Node.new(4)
    tree.insert(5)
    tree.value.should eq(4)
    right = tree.right.not_nil!
    right.value.should eq(5)
  end

  it "can create complex tree" do
    tree = Node.new(4)
    tree.insert(2)
    tree.insert(6)
    tree.insert(1)
    tree.insert(3)
    tree.insert(5)
    tree.insert(7)
    tree.value.should eq(4)
    left = tree.left.not_nil!
    left.value.should eq(2)
    left_left = left.left.not_nil!
    left_left.value.should eq(1)
    left_right = left.right.not_nil!
    left_right.value.should eq(3)
    right = tree.right.not_nil!
    right.value.should eq(6)
    right_left = right.left.not_nil!
    right_left.value.should eq(5)
    right_right = right.right.not_nil!
    right_right.value.should eq(7)
  end

  it "can sort single number" do
    tree = Node.new(2)
    tree.sort.should eq [2]
  end

  it "can sort if second number is smaller than first" do
    tree = Node.new(2)
    tree.insert(1)
    tree.sort.should eq [1, 2]
  end

  it "can sort if second number is same as first" do
    tree = Node.new(2)
    tree.insert(2)
    tree.sort.should eq [2, 2]
  end

  it "can sort if second number is greater than first" do
    tree = Node.new(2)
    tree.insert(3)
    tree.sort.should eq [2, 3]
  end

  it "can sort complex tree" do
    tree = Node.new(2)
    tree.insert(1)
    tree.insert(3)
    tree.insert(6)
    tree.insert(7)
    tree.insert(5)
    tree.sort.should eq [1, 2, 3, 5, 6, 7]
  end
end
