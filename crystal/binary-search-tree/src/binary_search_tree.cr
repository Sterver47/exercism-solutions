class Node
  getter value : Int32
  getter left, right : Node? = nil

  def initialize(@value : Int32) : Nil end

  def insert(value : Int32) : Nil
    if value <= @value
      @left.nil? ? (@left = Node.new(value)) : @left.try(&.insert(value))
    else
      @right.nil? ? (@right = Node.new(value)) : @right.try(&.insert(value))
    end
  end

  def sort : Array(Int32)
    sort_helper([] of Int32)
  end

  protected def sort_helper(result : Array(Int32)) : Array(Int32)
    @left.try &.sort_helper(result)
    result << @value
    @right.try &.sort_helper(result)
    result
  end
end
