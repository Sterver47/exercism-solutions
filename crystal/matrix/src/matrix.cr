class Matrix
  @rows : Array(Array(Int32))

  def initialize(matrix : String) : Nil
    @rows = matrix.lines.map(&.split.map(&.to_i))
  end

  def row(index : Int32) : Array(Int32)
    raise IndexError.new("Index out of bounds") if index <= 0 || index > @rows.size
    @rows[index - 1]
  end

  def column(index : Int32) : Array(Int32)
    raise IndexError.new("Index out of bounds") if index <= 0 || index > @rows[0].size
    @rows.map(&.[index - 1])
  end
end
